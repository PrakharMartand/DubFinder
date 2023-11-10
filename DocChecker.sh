#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

# Input and output file names
input_file="$1"
output_file="$2"

# Ensure the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Use grep with the -o option to extract the matching patterns
matches=$(grep -oE '\([^)]+' "$input_file" | sort | uniq -d)

# Check if there are any matches
if [ -z "$matches" ]; then
    echo "No matches found or no matches occurring more than once."
    exit 0
fi

# Export the matches to the output file
echo "$matches" > "$output_file"
echo "Matches occurring more than once exported to '$output_file'."
