#!/bin/bash

# Define the paths
nvim_config_dir="$HOME/.config/nvim"
backup_dir="$HOME/.config/nvim.bak"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to prompt user for confirmation
confirm_overwrite() {
    read -r -p "The directory '$nvim_config_dir' is not empty. Do you want to overwrite it with the configuration from '$script_dir/nvim'? (y/n): " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else
        return 1
    fi
}

# Check if nvim directory exists and is not empty
if [[ -d "$nvim_config_dir" && "$(ls -A $nvim_config_dir)" ]]; then
    echo "Backup existing nvim configuration..."
    # Check if backup directory exists, if not create it
    if [[ ! -d "$backup_dir" ]]; then
        mkdir -p "$backup_dir"
    fi
    # Backup existing nvim configuration
    cp -r "$nvim_config_dir" "$backup_dir"
    echo "Backup completed. The original configuration is stored in '$backup_dir'."

    # Prompt user for confirmation to overwrite
    confirm_overwrite
    overwrite=$?
    if [ $overwrite -eq 0 ]; then
        echo "Overwriting existing nvim configuration..."
        # Delete existing nvim configuration
        rm -rf "$nvim_config_dir"
        # Copy new nvim configuration
        cp -r "$script_dir/nvim" "$nvim_config_dir"
        echo "Configuration deployed successfully."
    else
        echo "Operation canceled by user."
    fi
else
    # Copy nvim configuration
    echo "Deploying nvim configuration..."
    cp -r "$script_dir/nvim" "$nvim_config_dir"
    echo "Configuration deployed successfully."
fi

