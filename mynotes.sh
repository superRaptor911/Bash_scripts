#!/bin/bash

arg1=$1
file="note"
ext=".md"
edit=0
arg_count=$#
args=("$@")

########################################################################################

parseArgs(){
    for (( i=0; i<$arg_count; i++ ))
    do
        case "${args[$i]}" in
            -e)
                edit=1
                ;;
            -f)
                let i=$i+1
                file="${args[$i]}"

                if [ "$file" == "" ]; then
                    echo "Error : empty file name"
                    exit 2
                fi
                ;;
            -fe)
                edit=1
                let i=$i+1
                file="${args[$i]}"

                if [ "$file" == "" ]; then
                    echo "Error : empty file name"
                    exit 2
                fi
                ;;
            -l)
                cd ~/Documents/mynotes
                ls | grep "$ext" | sed "s/$ext//"
                exit 0
                ;;
            -h)
                mynotesHelp
                exit 0
                ;;
            -je)
                mkdir -p ~/Documents/mynotes/journals
                edit=1
                file="journal/$(date +%d-%m-%y)"
                ;;
            -j)
                viewJournals
                exit 0
                ;;
            *)
                echo "wrong args"
                exit 2
        esac
    done
}

evaluate() {
    file="$file$ext"
    if [ $edit -eq 1 ]; then
        mkdir -p ~/Documents/mynotes
        vim ~/Documents/mynotes/$file
    else
        mdv ~/Documents/mynotes/$file
    fi
}

mynotesHelp() {
    echo -e "My Notes, View and edit notes"
    echo -e "  -e \t\tTo edit Note"
    echo -e "  -f \t\tTo specify Note"
    echo -e "  -l \t\tTo list Notes"
    echo -e "  -h \t\tTo display this output"
}

viewJournals() {
    cd ~/Documents/mynotes/journals
    files=($(ls *.md))
    # Check Count
    if [ ${#files[@]} -eq 0 ]; then
        echo "You dont have any journal"
        exit 0
    fi
    # Show Journals
    echo "Select one :"
    for (( i=0; i<${#files[@]}; i++ ))
    do
        echo -e "\t$i.) ${files[$i]}"
    done
    # Get User input
    read choice
    if [ $choice -gt ${#files[@]} ]; then
        echo "Invalid Input"
        exit 1
    fi
    file="Documents/mynotes/journals/${files[$choice]}"
    cd ~
    cat "$file"
}
#######################Main######Main##########################################
parseArgs
evaluate

