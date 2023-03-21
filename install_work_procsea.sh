#!/bin/bash
cp .bash_aliases ~/.bash_aliases
cp .bash_aliases_procsea ~/.bash_aliases_procsea
cp .bash_aliases_procsea_secret ~/.bash_aliases_procsea_secret
cp .emacs ~/.emacs
cp .gitconfig_procsea ~/.gitconfig
cp .vimrc ~/.vimrc
cp .inputrc ~/.inputrc
exec bash -l # load a new shell to get the differences
