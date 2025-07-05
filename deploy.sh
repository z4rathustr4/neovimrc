#!/bin/bash

# Define the paths
nvim_config_dir="$HOME/.config/nvim"
backup_dir="$HOME/.config/nvim.bak"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
font_get_cmd_url="https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/tags/v18.0d1e1.0.tar.gz"
utilities_dir="$HOME/.local/bin"

# Get SF-Mono-Nerd-Font from github.
get_fonts() {
	wget "$font_get_cmd_url"
	echo "[+] SF-Mono-Nerd-Font fetched."
}

get_fonts

# function to prompt user for confirmation
confirm_overwrite() {
	read -r -p "The directory '$nvim_config_dir' is not empty. Do you want to overwrite it with the configuration from '$script_dir/nvim'? (y/n): " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
		return 0
	else
		return 1
	fi
}

# check if nvim directory exists and is not empty
if [[ -d "$nvim_config_dir" && "$(ls -A $nvim_config_dir)" ]]; then
	echo "[+] Backup existing nvim configuration..."
	# check if backup directory exists, if not create it
	if [[ ! -d "$backup_dir" ]]; then
		mkdir -p "$backup_dir"
	fi
	# backup existing nvim configuration
	cp -r "$nvim_config_dir" "$backup_dir"
	echo "[+] Backup completed. The original configuration is stored in '$backup_dir'."

	confirm_overwrite
	overwrite=$?
	if [ $overwrite -eq 0 ]; then
		echo "[!] Overwriting existing nvim configuration..."
		# Delete existing nvim configuration
		rm -rf "$nvim_config_dir"
		# Copy new nvim configuration
		cp -r "$script_dir/nvim" "$nvim_config_dir"
		cp "$script_dir/.tmux.conf" $HOME
		echo "[+] Configuration deployed successfully."
	else
		echo "[!] Operation canceled by user."
	fi
else
	# Copy nvim configuration
	echo "[*] Deploying nvim configuration..."
	cp -r "$script_dir/nvim" "$nvim_config_dir"
	echo "[+] Configuration deployed successfully."
fi

# deploy utility scripts
if [[ -d $utilities_dir ]]; then
    echo "[+] Deploying utilities to $utilities_dir"
    cp -r "$script_dir/local/bin/"* "$utilities_dir" || {
			echo "[!] Failed to deploy scripts"
			exit 1
		}
    echo "[+] Scripts deployed"
	else
		mkdir -p "$utilities_dir"
		echo "[+] Deploying utilities to $utilities_dir"
		cp -r "$script_dir/local/bin/"* "$utilities_dir"
		echo "[+] Scripts deployed"
fi
