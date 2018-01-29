#!/bin/bash

for DOTFILE in .vimrc .tmux.conf .vim .bashrc .bash_profile
do
    echo "Linking $HOME/$DOTFILE..."
    if [ -e $HOME/$DOTFILE ]
    then
	echo "   Moving ${HOME}/${DOTFILE} to ${HOME}/${DOTFILE}_old first"
	    rm -rf ${HOME}/${DOTFILE}_old
        mv $HOME/$DOTFILE ${HOME}/${DOTFILE}_old
    fi
    ln -sf `pwd`/$DOTFILE $HOME/$DOTFILE
done

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

