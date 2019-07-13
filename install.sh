#!/bin/bash

# If prompt fails you might have to re-make according to docs
# https://github.com/twolfson/sexy-bash-prompt

# Make sure you install YouCompleteMe according to docs
# https://github.com/ycm-core/YouCompleteMe

FOLDER=$(pwd)

if [ -d "$FOLDER/.git" ]; then
    rm ~/.ycm_extra_conf.py
    ln -s $FOLDER/.ycm_extra_conf.py ~/.ycm_extra_conf.py
    rm ~/.prompt
    ln -s $FOLDER/.prompt ~/.prompt
    rm ~/.bashrc
    ln -s $FOLDER/.bashrc ~/.bashrc
    rm ~/.gitconfig
    ln -s $FOLDER/.gitconfig ~/.gitconfig
    rm ~/.vimrc
    ln -s $FOLDER/.vimrc ~/.vimrc
    rm ~/.tmux.conf
    ln -s $FOLDER/.tmux.conf ~/.tmux.conf
    rm ~/.gdbinit
    ln -s $FOLDER/.gdbinit ~/.gdbinit
fi

# Get Vundle unless we already have it
if [ ! -d "/home/aamador/.vim/bundle/Vundle.vim/" ] ; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install vundle plugins
vim +PluginInstall +qall

# Load new shell
source ~/.bashrc
