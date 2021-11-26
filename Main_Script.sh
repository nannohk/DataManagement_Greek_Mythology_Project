#!/bin/bash

echo "Welcome to Nathan's Greek Mythology Project"

echo "Obtaining text.... THE ARGONAUTICA "

wget https://www.gutenberg.org/cache/epub/830/pg830.txt.utf8.gzip -O story.txt.gz

gunzip story.txt.gz

echo "Text download completed in output file story.txt yaay"

echo "Extracting story from Story.txt."
sed -n '/BOOK I/,/BOOK I./p' story.txt > Story.txt 


mkdir namesFolder
cp Story.txt namesFolder/

cd namesFolder
awk 'match($0, / [A-Z][a-z][a-z][a-z]+ /) {printf substr($0,RSTART,RLENGTH)"\n"} ' Story.txt | xargs touch 

#awk 'match($0, / [A-Z][a-z][a-z][a-z]+ /) {printf substr($0,RSTART,RLENGTH)"\n"} ' Story.txt | sed 's/^\$PWD/namesFolder\///g' | xargs touch 
#awk '{print $0}' names.txt | touch $pwd/namesFolder/

echo "Cleaning up the directories."
rm story.txt
rm Story.txt
# Remove  64 non name words
rm After Alone Away Banded Bear Beginning Bitter Come Does Earth Earthborn Even Fair First From Grant   
rm  Meantime  More Moreover Most Mount Never Next Night Perish Likewise Long Love Loves
rm Quickly Quivering Sacred Shining Speak Still Such Surely Them Thus Then Thence 
rm There Therefore Thereupon This Thou Twelve What When Wherefore Whether Whither Will Wilt Would Zone Poor Here

echo "Exiting"
