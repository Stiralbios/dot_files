#!/bin/bash
cp .bash_aliases ~/.bash_aliases
cp .bash_aliases_procsea ~/.bash_aliases_procsea
cp .emacs ~/.emacs
cp .gitconfig_procsea ~/.gitconfig
cp .vimrc ~/.vimrc
exec bash -l # load a new shell to get the differences
