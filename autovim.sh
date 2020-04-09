#!/usr/bin/env bash
cp .vimrc ..
cp .vimrc.plugs ..
cd .vim
if [[ -d "~/.vim" ]]; then
    if [[ -d "~/.vim/UltiSnips" && -d "~/.vim/colors" ]]; then
        cp -r ./.vim/UltiSnips/* ~/.vim/UltiSnips/
        cp -r ./.vim/colors/* ~/.vim/colors/
    else
        cp -r * ~/.vim/
    fi
else
    mkdir ~/.vim
fi
