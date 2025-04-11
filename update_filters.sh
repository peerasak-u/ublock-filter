#!/bin/bash

# Define the output file
output_file="ublock-th-filters.txt"
filters_dir="filters"

# Get the current date
current_date=$(date +%Y-%m-%d)

# Write the header to the output file
cat > "$output_file" << EOL
! Title: Thai Content Filters (Combined)
! Description: Filters for Thai movie, manga, anime, and series websites.
! Homepage: https://github.com/peerasak/ublock-filter-th # Replace with your actual repo URL if different
! Last modified: $current_date
! Expires: 1 day (update frequency)

EOL

# Loop through each .txt file in the filters directory
for filter_file in "$filters_dir"/*.txt; do
  if [ -f "$filter_file" ]; then
    # Extract the filename without the path and extension
    filename=$(basename "$filter_file")
    filter_name="${filename%.*}"

    # Add a comment header for the section
    echo "" >> "$output_file" # Add a blank line for separation
    echo "! === Start of $filter_name filters ===" >> "$output_file"
    echo "" >> "$output_file" # Add a blank line for separation

    # Append the content of the filter file
    cat "$filter_file" >> "$output_file"

    # Add a comment footer for the section
    echo "" >> "$output_file" # Add a blank line for separation
    echo "! === End of $filter_name filters ===" >> "$output_file"
    echo "" >> "$output_file" # Add a blank line for separation
  fi
done

echo "Filter list '$output_file' updated successfully."

# Make the script executable (optional, but good practice)
chmod +x update_filters.sh
