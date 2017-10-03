#!/bin/bash

for DOTFILE in .vimrc .tmux.conf .vim
do
    echo "Linking $HOME/$DOTFILE..."
    if [ -e $HOME/$DOTFILE ]
    then
	echo "   Moving ${HOME}/${DOTFILE} to ${HOME}/${DOTFILE}_old first"
        mv $HOME/$DOTFILE ${HOME}/${DOTFILE}_old
    fi
    ln -sf `pwd`/$DOTFILE $HOME/$DOTFILE
done
