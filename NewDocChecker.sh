#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

# Input file name
input_file="$1"

# Ensure the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Get input string from the user
echo -n "Enter a string to search in the file: "
read search_string

# Use grep to find the matching lines and print line numbers
matching_lines=$(grep -n "$search_string" "$input_file" | cut -d':' -f1)

# Check if there are any matches
if [ -z "$matching_lines" ]; then
    echo "No matches found for the string '$search_string' in the file '$input_file'."
    exit 0
fi

# Output file name
output_file="output.txt"

# Print the entire matching lines to the output file
echo "Matching lines for the string '$search_string' in the file '$input_file':" > "$output_file"
for line_number in $matching_lines; do
    sed -n "${line_number}p" "$input_file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline after each line
done

echo "Results have been appended to '$output_file'."
