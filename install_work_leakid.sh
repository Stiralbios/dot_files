#!/bin/bash
cp .bash_aliases ~/.bash_aliases
cp .bash_aliases_leakid ~/.bash_aliases
cp .emacs ~/.emacs
cp .gitconfig_leakid ~/.gitconfig
cp .vimrc ~/.vimrc
exec bash -l # load a new shell to get the differences
