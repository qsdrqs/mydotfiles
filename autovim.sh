#!/usr/bin/env bash
cp .vimrc ..
cp .vimrc.plugs ..
if [[ -d "~/.vim" ]]; then
    if [[ -d "~/.vim/UltiSnips" && -d "~/.vim/colors" ]]; then
        cp -r .vim/UltiSnips/* ~/.vim/UltiSnips/
        cp -r .vim/colors/* ~/.vim/colors/
    else
        cp -r .vim/* ~/.vim/
    fi
else
    cp -r .vim ~
fi
