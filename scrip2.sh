#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <repo_name>"
    exit 1
fi


REPO_NAME=$1


ROOT_DIR="Root/${REPO_NAME}"
mkdir -p "$ROOT_DIR"

for file in "$REPO_NAME"/*.txt; do

    filename=$(basename -- "$file")
    prefix=$(echo "$filename" | cut -d'_' -f1)
    timestamp=$(echo "$filename" | cut -d'_' -f2 | cut -d'.' -f1)

    year=$(echo "$timestamp" | cut -d'-' -f1)
    month=$(echo "$timestamp" | cut -d'-' -f2)
    day=$(echo "$timestamp" | cut -d'-' -f3)
    hour=$(echo "$timestamp" | cut -d'-' -f4)
    minute=$(echo "$timestamp" | cut -d'-' -f5)
    second=$(echo "$timestamp" | cut -d'-' -f6)
    millisecond=$(echo "$timestamp" | cut -d'-' -f7)

    new_dir="${ROOT_DIR}/${prefix}/${year}/${month}/${day}/${hour}"
    mkdir -p "$new_dir"

    new_filename="${minute}${second}${millisecond}.dat"
    new_file="${new_dir}/${new_filename}"
    mv "$file" "$new_file"

    echo "$filename" > "$new_file"
    echo "$(realpath "$new_file")" >> "$new_file"
    echo "script1.sh" >> "$new_file"
    chmod 600 "$new_file"
done