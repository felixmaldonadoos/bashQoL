#!/bin/bash

# List of files to check and copy
files=(
    ~/.bash_aliases
    ~/.bashrc
    ~/.bash_functions
    ~/.ssh
    ~/.gitconfig
)

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

# Loop through each file and check if it exists, then process it
for file in "${files[@]}"; do
    if [ -e "$file" ]; then
        # Check if the file is a directory, special handling for directories
        if [ -d "$file" ]; then
            # Use -R to copy directories recursively
            echo "Copying directory $file to $destination_directory..."
            cp -R "$file" "$destination_directory"
        else
            echo "Copying $file to $destination_directory..."
            cp "$file" "$destination_directory"
        fi
    else
        echo "File $file does not exist."
    fi
done

echo "Process completed..."
