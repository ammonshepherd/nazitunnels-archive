#!/bin/bash

# This script removes occurrences of "https://nazitunnels.org/" in HTML <a> and <img> tags
# from all .html files in the current directory and its subdirectories.

# Set the locale to handle different character encodings
export LANG=C

# Function to process a single file
process_file() {
    local file="$1"
    # Remove occurrences of the URL in <a> and <img> tags
    sed -i '' -E 's@<a([^>]*)http://nazitunnels.org/([^>]*)>@<a\1\2>@g; s@<img([^>]*)http://nazitunnels.org/([^>]*)>@<img\1\2>@g' "$file"
}

export -f process_file

# Find all .html files in the current directory and subdirectories
find . -type f -name "*.html" -exec bash -c 'process_file "$0"' {} \;

echo "URL removal completed."

