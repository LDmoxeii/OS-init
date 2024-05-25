#! /usr/bin/env sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}

case $category in
    directory)
        exa -l --no-user --no-time --icons --no-permissions --no-filesize "$1" 2>/dev/null ;;
    text|application)
        (bat -p --style numbers --color=always "$1" 2>/dev/null | head -1000) ;;
    application/pdf)
        pdftotext "$1" - | less ;;
    image)
        ~/.zsh/img_preview "$1" 2>/dev/null ;;
    *)
        echo "$1 is a $category file" ;;
esac
