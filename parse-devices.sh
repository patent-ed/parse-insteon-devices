#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

input_file=$1
output_file=$2

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file does not exist"
    exit 1
fi

# Create an empty CSV file with UTF-8 encoding
echo -n > "$output_file"

# Process the input file
awk -v RS="---------------------------------------------------" '{
    gsub(/\n$/, "", $0)  # Remove trailing newline character
    gsub(/\n/, ",")      # Replace newline characters with commas
    if (length($0) > 0) {
        print $0 >> "'"$output_file"'"
    }
}' "$input_file"

# Convert the CSV file to UTF-8 encoding
iconv -f "$(file -bi "$output_file" | sed -e 's/.*charset=\(.*\)/\1/')" -t "UTF-8" "$output_file" > "${output_file%.*}_utf8.csv"

echo "Processed data saved in ${output_file%.*}_utf8.csv"
