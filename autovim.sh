#!/usr/bin/env bash
cp .vimrc ..
cp .vimrc.plugs ..
cd .vim
mkdir ~/.vim
cp -r * ~/.vim/
