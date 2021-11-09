#!/bin/bash

echo "Welcome to Nathan's Greek Mythology Project"

echo "Obtaining text.... THE ARGONAUTICA "

wget https://www.gutenberg.org/cache/epub/830/pg830-images.html.utf8 -O story.txt

echo "Text download completed in output file story.txt yaay"

echo "Running Awk Extraction Scrtipt.....storyExtraction.awk"
./storyExtraction.awk

echo "Exiting"
