#!/usr/bin/env bash
#
# Dotfiles setup:
#   1. Installs the latest SF Mono Nerd Font (latest tag from GitHub)
#   2. Installs the latest Neovim AppImage to /opt/nvim/nvim
#   3. Deploys files according to a MANIFEST (symlink / makeinstall)
#   4. Installs tmux plugin manager (tpm)
#
# Usage: ./setup.sh [path/to/MANIFEST]   (defaults to ./MANIFEST next to this script)
#
# MANIFEST format (delimiter '#', paths relative to the dotfiles repo):
#   <source>#symlink#<dest dir relative to $HOME, optional>
#   <dir>#makeinstall
# Lines that are empty or start with '#' are ignored.

set -uo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
manifest="${1:-$script_dir/MANIFEST}"

font_repo="epk/SF-Mono-Nerd-Font"
fonts_dir="$HOME/.local/share/fonts"
nvim_install_dir="/opt/nvim"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

trim() {
    local v="$1"
    v="${v#"${v%%[![:space:]]*}"}"
    v="${v%"${v##*[![:space:]]}"}"
    printf '%s' "$v"
}

# Print the latest tag of a GitHub repo.
# First tries the /releases/latest redirect, then falls back to the newest tag.
github_latest_tag() {
    local repo="$1" url="" tag=""

    url="$(curl -fsSL -o /dev/null -w '%{url_effective}' \
        "https://github.com/$repo/releases/latest" 2>/dev/null)" || url=""
    if [[ "$url" == */releases/tag/* ]]; then
        echo "${url##*/}"
        return 0
    fi

    tag="$(git ls-remote --tags --refs --sort=-v:refname \
        "https://github.com/$repo.git" 2>/dev/null |
        head -n1 | sed 's|.*refs/tags/||')"
    if [[ -n "$tag" ]]; then
        echo "$tag"
        return 0
    fi

    return 1
}

# ---------------------------------------------------------------------------
# Fonts
# ---------------------------------------------------------------------------

get_fonts() {
    local tag archive extract_dir

    tag="$(github_latest_tag "$font_repo")" || {
        echo "[E] Could not determine latest tag for $font_repo."
        return 1
    }
    echo "[*] Latest font tag: $tag"

    archive="$tmp_dir/font.tar.gz"
    extract_dir="$tmp_dir/font"

    curl -fL "https://github.com/$font_repo/archive/refs/tags/$tag.tar.gz" -o "$archive" || {
        echo "[E] Failed to download font."
        return 1
    }
    echo "[+] Font archive fetched."

    # GitHub names the top-level folder "<repo>-<tag without leading v>", which
    # is hard to predict, so strip it instead of guessing.
    mkdir -p "$extract_dir" "$fonts_dir"
    tar -xzf "$archive" -C "$extract_dir" --strip-components=1 || {
        echo "[E] Failed to extract archive."
        return 1
    }

    find "$extract_dir" -type f \( -iname '*.otf' -o -iname '*.ttf' \) \
        -exec cp -f {} "$fonts_dir" \; || {
        echo "[E] Failed to copy fonts."
        return 1
    }

    fc-cache -f "$fonts_dir"
    echo "[+] Fonts installed and cache updated."
}

# ---------------------------------------------------------------------------
# Neovim (AppImage)
# ---------------------------------------------------------------------------

install_nvim() {
    local arch asset

    case "$(uname -m)" in
        x86_64)          arch="x86_64" ;;
        aarch64 | arm64) arch="arm64" ;;
        *)
            echo "[E] Unsupported architecture: $(uname -m)"
            return 1
            ;;
    esac
    asset="nvim-linux-$arch.appimage"

    echo "[*] Downloading latest Neovim AppImage ($asset)..."
    curl -fL "https://github.com/neovim/neovim/releases/latest/download/$asset" \
        -o "$tmp_dir/nvim" || {
        echo "[E] Failed to download Neovim."
        return 1
    }

    chmod u+x "$tmp_dir/nvim"

    sudo mkdir -p "$nvim_install_dir" || return 1
    sudo cp "$tmp_dir/nvim" "$nvim_install_dir/nvim" || {
        echo "[E] Failed to copy nvim to $nvim_install_dir."
        return 1
    }
    sudo chmod u+x "$nvim_install_dir/nvim"
    # Make sure the current user owns it, so the exec bit is theirs.
    sudo chown "$(id -un)":"$(id -gn)" "$nvim_install_dir/nvim"

    echo "[+] Neovim installed at $nvim_install_dir/nvim"
    echo "    (add $nvim_install_dir to your PATH if it is not there already)"
}

# ---------------------------------------------------------------------------
# MANIFEST deployment
# ---------------------------------------------------------------------------

do_symlink() {
    local src="$1" dest="$2"
    local source_path link_dir target

    source_path="$script_dir/$src"
    if [[ ! -e "$source_path" ]]; then
        echo "[E] Source does not exist: $source_path"
        return 1
    fi

    dest="${dest#/}"
    link_dir="$HOME${dest:+/$dest}"
    target="$link_dir/$(basename "$src")"

    mkdir -p "$link_dir" || return 1

    if [[ -L "$target" ]]; then
        rm "$target"
    elif [[ -e "$target" ]]; then
        local backup="$target.bak.$(date +%Y%m%d%H%M%S)"
        echo "[!] $target exists, moving it to $backup"
        mv "$target" "$backup" || return 1
    fi

    ln -s "$source_path" "$target" || return 1
    echo "[+] $target -> $source_path"
}

do_makeinstall() {
    local src="$1"
    local dir="$script_dir/$src"

    if [[ ! -d "$dir" ]]; then
        echo "[E] Not a directory: $dir"
        return 1
    fi

    echo "[*] Running 'sudo make install' in $src"
    (cd "$dir" && sudo make install) || {
        echo "[E] make install failed in $src"
        return 1
    }
    echo "[+] Installed $src"
}

deploy_manifest() {
    local file="$1" line src action dest line_no=0 failed=0

    if [[ ! -f "$file" ]]; then
        echo "[E] MANIFEST not found: $file"
        return 1
    fi

    echo "[*] Deploying from $file"

    while IFS= read -r line || [[ -n "$line" ]]; do
        line_no=$((line_no + 1))
        line="${line%$'\r'}"

        # skip blank lines and comments
        [[ -z "$(trim "$line")" || "$(trim "$line")" == \#* ]] && continue

        IFS='#' read -r src action dest <<<"$line"
        src="$(trim "${src%/}")"
        action="$(trim "$action")"
        dest="$(trim "$dest")"

        case "$action" in
            symlink)
                do_symlink "$src" "$dest" || failed=1
                ;;
            makeinstall)
                do_makeinstall "$src" || failed=1
                ;;
            *)
                echo "[!] Line $line_no: unknown action '$action', skipping"
                failed=1
                ;;
        esac
    done <"$file"

    return $failed
}

# ---------------------------------------------------------------------------
# tmux plugin manager
# ---------------------------------------------------------------------------

install_tpm() {
    local tpm_dir="$HOME/.tmux/plugins/tpm"

    if [[ -d "$tpm_dir" ]]; then
        echo "[+] tpm already installed"
        return 0
    fi

    echo "[*] Installing tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

get_fonts || echo "[!] Font installation failed, continuing..."
install_nvim || echo "[!] Neovim installation failed, continuing..."
deploy_manifest "$manifest" || echo "[!] Some MANIFEST entries failed."
install_tpm || echo "[!] tpm installation failed."

echo "[+] Done."
