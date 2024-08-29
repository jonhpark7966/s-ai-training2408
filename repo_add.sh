#!/bin/bash

# Check if the input file is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_with_repo_links>"
    exit 1
fi

# Input file containing GitHub repository links
input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "File not found: $input_file"
    exit 1
fi

# Loop through each line in the input file
while IFS= read -r repo_link; do
    # Skip empty lines
    if [ -z "$repo_link" ]; then
        continue
    fi

    # Add the repository as a submodule
    git submodule add "$repo_link"
done < "$input_file"

echo "All repositories have been added as submodules."
