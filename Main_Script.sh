#!/bin/bash

echo "Welcome to Nathan's Greek Mythology Project"

echo "Obtaining text.... THE ARGONAUTICA "

wget https://www.gutenberg.org/cache/epub/830/pg830.txt.utf8.gzip -O Story.txt

echo "Text download completed in output file Story.txt yaay"

echo "Extracting story from Story.txt."
sed -n'/^THE ARGONAUTICA/,/^ENDNOTES:/p' Story.txt > Story.txt 

echo "Exiting"
