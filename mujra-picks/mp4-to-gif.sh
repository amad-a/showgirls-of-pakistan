#!/bin/bash

directory="./"
file_type=".mp4"
expression="random"

for file in "$directory"*"$file_type"; do
	if [[ "$file" =~ "$expression" ]]; then
		filename_no_ext=$(basename "$file" .mp4)
		echo "$file"
		ffmpeg -i "$file" "$filename_no_ext.gif"
	fi
done
