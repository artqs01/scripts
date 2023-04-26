#!/bin/bash
for file in $(find -name "*.MOV"); do
    mp4="${file%.MOV}.mp4"
    echo $mp4
    ffmpeg -i "$file" "$mp4"
    rm "$file"
done
