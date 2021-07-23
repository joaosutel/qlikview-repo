#!/bin/sh

# Global variables
qv="C:/Program Files/QlikView/qv.exe"
rootDir=$(git rev-parse --show-toplevel)

# Git modified files
gitFiles=$(git status --untracked-files --porcelain | cut -b4-)
gitFiles="${gitFiles// /*}"

# Loop into git files array
for file in $gitFiles; do
    # Checking if the file was deleted
    if [ -f "$file" ]; then
        # File variables
        fullpath="$rootDir/$file"
        #baseName="$(basename -- $file)"
		baseName="${file##*/}"
        fileName=${file%.*}
        extension=${file#$fileName.}
        prjFolder="$fileName-prj"
        copyFrom="$prjFolder/LoadScript.txt"
        copyTo=$(echo "$fullpath" | sed "s/$baseName//")
		copyTo+="[LoadScript]-$baseName.txt"
        
        # Checking if the file has a qvw extension
        if [[ $extension = "qvw" ]]; then
            echo " "
            echo Preparing "${file^^}" to GitHub
            echo Creating PRJ folder...
                mkdir "$prjFolder"
            echo Removing data from QVW...
                `"$qv" -r -vvNoData=1 "$fullpath"`
            echo Copying LoadScript.txt to QVW folder...
                cp "$copyFrom" -rf "$copyTo" 
            echo Removing PRJ folder...
                rm -rf "$prjFolder"
        fi
    else 
        echo "$file was deleted."
    fi
done

echo " "
echo All files are ready to GitHub!
