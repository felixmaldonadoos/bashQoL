#!/bin/bash

echo "not working just yet; not appending missing files"
exit 1 # Exit with error
# Script to update .bash_aliases within the directory specified by $BASE

# Check if the filepath argument is provided
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <path_to_new_aliases_file>"
#     exit 1
# fi

new_aliases=".bash_aliases"
# Ensure BASE is set and not empty
if [ -z "$BASE" ]; then
    echo "The BASE environment variable is not set. Exiting."
    exit 1
fi

bash_aliases="$BASE/.bash_aliases"  # Use BASE environment variable

# Ensure the directory exists (in case it doesn't)
mkdir -p "$BASE"

# Check if the bash_aliases file exists
if [ -f "$bash_aliases" ]; then
    # File exists, append only new aliases
    while IFS= read -r line; do
        # Check if the line from new_aliases is already in bash_aliases
        if ! grep -Fxq "$line" "$bash_aliases"; then
            # If not, append it to bash_aliases
            echo "$line" >> "$bash_aliases"
        fi
    done < "$new_aliases"
else
    # .bash_aliases does not exist, create it and copy all lines
    echo "Copying new aliases to $bash_aliases"
    touch "$bash_aliases"  # Ensure the file exists
    while IFS= read -r line; do
        echo "$line" >> "$bash_aliases"
    done < "$new_aliases"
fi

echo "Aliases updated successfully."
