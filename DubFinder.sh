#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <input.md> <output.md>"
  exit 1
fi

input_file="$1"
output_file="$2"

if [ ! -f "$input_file" ]; then
  echo "Input file not found: $input_file"
  exit 1
fi

# Use grep to find lines ending with a '?' character
duplicated_lines=$(grep -E '.*\?$' "$input_file" | sort | uniq -d)

if [ -n "$duplicated_lines" ]; then
  echo "Duplicated lines ending with '?' in $input_file:"
  echo "$duplicated_lines" > "$output_file"

  # Add Markdown formatting to make all questions bold
  sed -i 's/\(.*\)/**\1**/' "$output_file"
  
  echo "Duplicated lines have been exported to $output_file with questions bold."
else
  echo "No duplicated lines ending with '?' found in $input_file."
fi
