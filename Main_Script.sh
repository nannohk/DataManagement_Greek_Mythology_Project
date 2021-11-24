#!/bin/bash

echo "Welcome to Nathan's Greek Mythology Project"

echo "Obtaining text.... THE ARGONAUTICA "

wget https://www.gutenberg.org/cache/epub/830/pg830.txt.utf8.gzip -O story.txt.gz

gunzip story.txt.gz

echo "Text download completed in output file story.txt yaay"

echo "Extracting story from Story.txt."
sed -n '/BOOK I/,/BOOK I./p' story.txt > Story.txt 

echo "Cleaning up the directory."
rm story.txt

awk -f nameExtraction Story.txt
echo "Exiting"
