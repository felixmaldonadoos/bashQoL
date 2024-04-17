#!/bin/bash

# Corrected declaration without spaces around "="
default_directory="backups/"

# List of files to check and copy using full paths for clarity
files=(
    "$HOME/.bash_aliases"
    "$HOME/.bashrc"
    "$HOME/.bash_functions"
    "$HOME/.ssh"
    "$HOME/.gitconfig"
)

# Check if a directory was passed as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <destination_directory>"
    echo "No directory specified. Using default '$default_directory' directory."
    destination_directory=$default_directory
    # Ensure the default directory is created
    mkdir -p "$destination_directory"
else
    destination_directory="$1"
    # Check if the specified directory exists, if not, create it
    if [ ! -d "$destination_directory" ]; then
        echo "Specified directory does not exist. Creating new directory: $destination_directory"
        mkdir -p "$destination_directory"
    fi
fi
