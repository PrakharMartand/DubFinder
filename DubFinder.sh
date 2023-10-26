#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename.md>"
  exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Use grep to find lines ending with a '?' character
duplicated_lines=$(grep -E '.*\?$' "$filename" | sort | uniq -d)

if [ -n "$duplicated_lines" ]; then
  echo "Duplicated lines ending with '?' in $filename:"
  echo "$duplicated_lines"
else
  echo "No duplicated lines ending with '?' found in $filename."
fi
