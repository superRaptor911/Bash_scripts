#!/bin/bash

arg1=$1
file="note"
ext=".md"

edit=0
plainText=0

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

            -pdf)
                toPdf
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
    elif [ $plainText -eq 1 ]; then
        cat ~/Documents/mynotes/$file
    else
        mdv ~/Documents/mynotes/$file
    fi
}

mynotesHelp() {
    echo -e "My Notes, View and edit notes"
    echo -e "  -e           \t\tTo edit Note"
    echo -e "  -f filename  \t\tTo specify Note"
    echo -e "  -l           \t\tTo list Notes"
    echo -e "  -h           \t\tTo display this output"
    echo -e "  -t           \t\tView As plain Text"
    echo -e "  -fe filename \t\tSame as -f and -e combined"
    echo -e "  -pdf         \t\tConvert note into pdf"
}

toPdf() {
    fl="$file$ext"

    cat ~/Documents/mynotes/$fl | markdown -o out.html &&
        wkhtmltopdf out.html "$file.pdf" && rm out.html &&
        echo "PDF saved as $file.pdf"
}

#######################Main######Main##########################################
parseArgs
evaluate

