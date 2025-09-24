#!/bin/bash

directory="./"
file_type=".mp4"

for file in "$directory"*"$file_type"; do
	if [ -f "$file" ]; then
		filename_no_ext=$(basename "$file" .mp4)
		echo "filename: $file"
		#ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 -sexagesimal "$file"

		duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file")

		random_start=$(echo "scale=2; $RANDOM / 32767 * ($duration - 5)" | bc)
		echo "random start: $random_start"

		echo "poop: $filename_no_ext"
		ffmpeg -ss "$random_start" -i "$file" -t 5 -c copy "random-$filename_no_ext.mp4"
	fi
done
