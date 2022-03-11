#!/bin/bash

file=$(echo $1 | sed -e "s/.asm//g")
cp $1 ~/.dosbox/
cd ~/.dosbox/
echo -e "MASM.EXE $file;\nLINK.EXE $file;\n$file" > b.bat
dosbox b.bat

# cleanup
rm "$file.asm"
file=$(echo $file | tr [a-z] [A-Z])
rm "$file.OBJ" "$file.EXE" "$file.CRF" 
# # dosbox b.bat -exit

