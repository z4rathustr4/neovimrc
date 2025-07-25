# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
setopt autocd              # change directory just by typing its name
# setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# LS_COLORS theme
# Source:
# wget "https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid_0.8.0_amd64.deb"
# sudo dpkg -i vivid_0.8.0_amd64.deb
# DISABLE DIRCOLORS LOGIC BELOW!!!!!
export LS_COLORS="$(vivid generate snazzy)"

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# Custom completion settings, shamelessly stolen from https://github.com/gh0stzk/dotfiles
# Props to him!
autoload -Uz compinit

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump

# plugins
plugins=(fzf-zsh-plugin exercism virtualenv)

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }

zstyle ':completion:*' verbose true
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{white}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{blue}%f %F{yellow}%b%f]-'
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  '+r:|[._-]=* r:|=*' \
  '+l:|=*'
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=41;5;15;1'

  zstyle ':completion:*:*:*:*:*' menu select
  zstyle ':completion:*' auto-description 'specify: %d'
  zstyle ':completion:*' completer _expand _complete
  zstyle ':completion:*' format 'Completing %d'
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*' list-colors ''
  zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
  # zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
  zstyle ':completion:*' rehash true
  zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
  zstyle ':completion:*' use-compctl false
  zstyle ':completion:*' verbose true
  zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-41
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

virtualenv_prompt() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%{%B%F{white}%}($(basename "$VIRTUAL_ENV")) %{%f%b%}"
  fi
}


configure_prompt() {
  prompt_symbol=㉿
  # Skull emoji for root terminal
  #[ "$EUID" -eq 0 ] && prompt_symbol=💀
  case "$PROMPT_ALTERNATIVE" in
    twoline)
      PROMPT='$(virtualenv_prompt)%B%{%F{203}%}%n@%m %{%F{41}%}%~ %{%f%}%bλ '
      ;;
    oneline)
      PROMPT='$(virtualenv_prompt)%B%{%F{203}%}%n@%m %{%F{41}%}%~ %{%f%}%bλ '
      ;;
    backtrack)
      PROMPT='$(virtualenv_prompt)%B%{%F{203}%}%n@%m %{%F{41}%}%~ %{%f%}%bλ '
      ;;
  esac
  unset prompt_symbol
}

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
  # override default virtualenv indicator in prompt
  VIRTUAL_ENV_DISABLE_PROMPT=1

  configure_prompt

    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
      . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
      ZSH_HIGHLIGHT_STYLES[default]='fg=15'
      ZSH_HIGHLIGHT_STYLES[path]='fg=15,bold'
      ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=15'
      ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=15'
      ZSH_HIGHLIGHT_STYLES[globbing]='fg=15'
      ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=15'
      ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
      ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
      ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
      ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
      ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
      ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
      ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
      ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
      ZSH_HIGHLIGHT_STYLES[command-substitution]=none
      ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
      ZSH_HIGHLIGHT_STYLES[process-substitution]=none
      ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
      ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
      ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
      ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
      ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
      ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
      ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
      ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
      ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
      ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
      ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
      ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
      ZSH_HIGHLIGHT_STYLES[assign]=none
      ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
      ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
      ZSH_HIGHLIGHT_STYLES[named-fd]=none
      ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
      ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
      ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
      ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
      ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
      ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
      ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
      ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
      ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
  else
    # PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
    PROMPT="%B%{%F{203}%}%n%{%F{203}%}@%{%F{203}%}%m %{%F{41}%}%~ %{%f%}%bλ "

fi
unset color_prompt force_color_prompt

toggle_oneline_prompt(){
  if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
    PROMPT_ALTERNATIVE=twoline
  else
    PROMPT_ALTERNATIVE=oneline
  fi
  configure_prompt
  zle reset-prompt
}
zle -N toggle_oneline_prompt
# bindkey ^P toggle_oneline_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
    TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
    ;;
  *)
    ;;
esac

precmd() {
  # Print the previously configured title
  print -Pnr -- "$TERM_TITLE"

    # Print a new line before the prompt, but only if it is not the first line
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
      if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
        _NEW_LINE_BEFORE_PROMPT=1
      else
        print ""
      fi
    fi
  }

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  # test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip --color=auto'

  export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
  export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
  export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
  export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
  export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
  export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
  export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -F'

# START CUSTOM #
# ------------ #

alias vim='nvim'
alias rcp='rsync -a --progress --stats '
alias htbon='sudo openvpn /home/pwn/ovpnconfig/lab_n3uroh4lt.ovpn 2>/dev/null'
alias fd='fdfind'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  # change suggestion color
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
  . /etc/zsh_command_not_found
fi

command_not_found_handler() {
  printf "%s%s? Whatcha mean?\n" "$acc" "$0" >&2
  return 127
}


function fzf-lovely(){

  if [ "$1" = "h" ]; then
    fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
      echo {} is a binary file ||
      (bat --style=numbers --color=always {} ||
      highlight -O ansi -l {} ||
      coderay {} ||
      rougify {} ||
      cat {}) 2> /dev/null | head -500'

  else
    fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
      echo {} is a binary file ||
      (bat --style=numbers --color=always {} ||
      highlight -O ansi -l {} ||
      coderay {} ||
      rougify {} ||
      cat {}) 2> /dev/null | head -500'
  fi
}


function settarget() {
  if [ -z "$1" ]; then
    echo "Usage: settarget <IPv4_address>"
    return 1
  fi
  export TARGET="$1"
  echo "TARGET set to '$TARGET'"
}


function htbferox() {
  if [ -z "$1" ]; then
    echo "Usage: htbferox <full-url>"
    return 1
  fi

  TARGET="$1"
  WORDLIST="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt"
  THREADS=20
  DEPTH=3

  echo "[*] Starting feroxbuster on $TARGET ..."
  OUTPUT_FILE="$(basename "$TARGET" | tr '/' '_').log"
  feroxbuster --url "$TARGET" --wordlist "$WORDLIST" --depth "$DEPTH" --threads "$THREADS" --quiet -o "$OUTPUT_FILE"

  echo "[*] Checking for 403/401 responses..."
  # Extract URLs with 403/401
  grep -E "\s(403|401)\s" ferox-initial.log | awk '{print $2}' | while read -r url; do
  echo "[!] Found protected URL: $url"
  echo "[*] Trying common bypass tricks..."

  for bypass in "/." "/..;/" "%2e/" "%2e%2e/" "/%2e%2e/" "/%20/" "/%09/" "//" "/./"; do
    try_url="${url}${bypass}"
    echo "[*] Testing $try_url"
    curl -sk -o /dev/null -w "%{http_code} %{url_effective}\n" "$try_url" | grep -E "200|301|302"
  done
done

echo "[✓] Initial scan + bypass attempts complete."
}


# If eza is installed, then go with it
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -l --group-directories-first --color=auto'
fi

if command -v batcat >/dev/null 2>&1; then
  alias cat='batcat --color=always'
fi

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export HTB_TOKEN=[REDACTED]

#--------------------------------- htb-cli STUFF ------------------------------

source /home/pwn/.oh-my-zsh/custom/plugins/htb-cli/htb-cli-completion.zsh
source /home/pwn/.oh-my-zsh/custom/plugins/gobuster/gobuster.zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"

. "$HOME/.cargo/env"
export PATH=/usr/lib/cargo/bin/coreutils:$PATH


fpath=(~/.zsh.d/ $fpath)

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
