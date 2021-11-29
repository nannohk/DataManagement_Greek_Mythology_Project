#!/bin/bash
echo"---------------------------------------------"
echo "Welcome to Nathan's Greek Mythology Project"
echo "Obtaining text.... THE ARGONAUTICA "
echo"---------------------------------------------"

wget https://www.gutenberg.org/cache/epub/830/pg830.txt.utf8.gzip -O story.txt.gz

gunzip story.txt.gz

echo "Text download completed in output file story.txt"

echo "Extracting story from Story.txt."
sed -n '/BOOK I/,/BOOK I./p' story.txt > Story.txt 

masterDirectory=$PWD

mkdir namesFolder
cp Story.txt namesFolder/

cd namesFolder
awk 'match($0, / [A-Z][a-z][a-z][a-z]+ /) {printf substr($0,RSTART,RLENGTH)"\n"} ' Story.txt | xargs touch 


# Remove  64 non name words
rm After Alone Away Banded Bear Beginning Bitter Come Does Earth Earthborn Even Fair First From Grant Wandering  
rm  Meantime  More Moreover Most Mount Never Next Night Perish Likewise Long Love Loves These Nevertheless
rm Quickly Quivering Sacred Shining Speak Still Such Surely Them Thus Then Thence With Straightway King
rm There Therefore Thereupon This Thou Twelve What When Wherefore Whether Whither Will Wilt Would Zone Poor Here

# Master array of character names 
declare -a fileNames
for name in *;
do 
    fileNames=("${fileNames[@]}" "$name");
done

echo "Setting up Mongo insert characters file => characters.js"
for filename in ${fileNames[@]};
do 
    #Obtain the lines associated with a particular name and add insert statements to the file
    grep -n ${filename} $masterDirectory/story.txt | awk ' BEGIN { FS= OFS = ":"} {printf("\""$1"\",")}' >> temp
  
    #Add list of lines with the particular name
    #Append instructions to files
    #------------------------------------------------------------------------------------------------------------
    # This line can be used when the insert data is a lot
    # echo "db.GreekCharacters.insert({\"name\":\"$filename\",\"lines\":[$(cat temp)\"9999\"]})" >> $filename;
    #------------------------------------------------------------------------------------------------------------

    echo "db.GreekCharacters.insert({\"name\":\"$filename\",\"lines\":[$(cat temp)\"9999\"]})" >> characters.js
    rm temp
done

# move character list to main directory
mv characters.js $masterDirectory

cd $masterDirectory

echo "Cleaning up the directories."
rm story.txt
rm Story.txt
rm -r namesFolder

# echo "Creating greek character database"
 mongo GreekCharacters < characters.js

echo "Exiting"
