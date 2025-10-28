#!/bin/bash

# Initialize a counter
counter=1

# Combine and sort all jpg and png files
files=$(ls *.jpg *.png *.webp | sort)

# Loop through the sorted list of files
for file in $files; do
	# Extract the file extension
	extension="${file##*.}"
	# Format new file name with leading zeros and keep the original extension
	new=$(printf "%03d.$extension" "$counter")
	# Only rename the file if the new name does not exist
	if [ ! -e "$new" ]; then
		mv -- "$file" "$new"
	else
		echo "File $new already exists. Skipping $file"
	fi
	# Increment the counter
	((counter++))
done
