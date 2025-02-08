#!/bin/bash

# Output file
output_file="most_common_word_per_year.txt"

# Clear previous output file
> "$output_file"

# Extract unique years from dataset
years=$(awk '{print $1}' dataset.txt | sort -u)

# Loop through each year and find the most common word
for year in $years; do
    # Extract words for that year (excluding the year itself)
    words=$(awk -v y="$year" '$1 == y {for (i=2; i<=NF; i++) print $i}' dataset.txt)

    # Find the most common word using sort and uniq
    most_common=$(echo "$words" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

    # Print result and save it to the output file
    echo "$year: $most_common" | tee -a "$output_file"
done

echo "Results saved in $output_file"
