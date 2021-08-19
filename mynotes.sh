#!/bin/bash

arg1=$1
file="note"
ext=".md"

edit=0
plainText=0
copyToClip=0

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
                echo "Your Notes ->"
                ls | grep "$ext" | sed "s/$ext//" | awk '{print "  -  " $1}'
                exit 0
                ;;
            -h)
                mynotesHelp
                exit 0
                ;;
            -t)
                plainText=1
                ;;

            -c)
                copyToClip=1
                ;;

            -pdf)
                toPdf
                exit 0
                ;;

            -rm)
                removeNote
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
    # Edit?
    if [ $edit -eq 1 ]; then
        mkdir -p ~/Documents/mynotes
        nvim ~/Documents/mynotes/$file

    # Plain text
    elif [ $plainText -eq 1 ]; then
        if [ $copyToClip -eq 1 ]; then
            cat ~/Documents/mynotes/$file | xclip -selection clipboard
        else
            cat ~/Documents/mynotes/$file
        fi

    # Markdown display
    else
        mdv ~/Documents/mynotes/$file
    fi
}

mynotesHelp() {
    echo -e "My Notes, View and edit notes\n"
    echo -e "  -e           \t\tTo edit Note"
    echo -e "  -f filename  \t\tTo specify Note"
    echo -e "  -l           \t\tTo list Notes"
    echo -e "  -h           \t\tTo display this output"
    echo -e "  -t           \t\tView As plain Text"
    echo -e "  -c           \t\tcopy to clipboard, used with -t"
    echo -e "  -fe filename \t\tSame as -f and -e combined"
    echo -e "  -pdf         \t\tConvert note into pdf"
    echo -e "  -rm          \t\tdelete note"
}

toPdf() {
    fl="$file$ext"

    cat ~/Documents/mynotes/$fl | markdown -o out.html &&
        marginArgs="--margin-left 0cm --margin-right 0cm --margin-top 0cm --margin-bottom 0cm"
        wkhtmltopdf --enable-local-file-access --user-style-sheet "$file.css" $marginArgs  out.html "$file.pdf" &&

        rm out.html && echo "PDF saved as $file.pdf"
}

removeNote() {
    file="$file$ext"
    rm ~/Documents/mynotes/$file &&
    echo "Removed $file"
}

#######################Main######Main##########################################
parseArgs
evaluate

