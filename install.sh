#!/bin/sh

set -e

CWD=$(pwd)
ln -s $CWD/ackrc ~/.ackrc
ln -s $CWD/elinks.conf ~/.elinks.conf
ln -s $CWD/gitconfig ~/.gitconfig
ln -s $CWD/gitignore_global ~/.gitignore_global
ln -s $CWD/gvimrc ~/.gvimrc
ln -s $CWD/hgrc ~/.hgrc
ln -s $CWD/inputrc ~/.inputrc
ln -s $CWD/muttrc ~/.muttrc
ln -s $CWD/msmtprc ~/.msmtprc
ln -s $CWD/offlineimaprc ~/.offlineimaprc
ln -s $CWD/offlineimap.py ~/.offlineimap.py
ln -s $CWD/tmux.conf ~/.tmux.conf
ln -s $CWD/vimperatorrc ~/.vimperatorrc
ln -s $CWD/vimrc ~/.vimrc
ln -s $CWD/zprofile ~/.zprofile
ln -s $CWD/zshrc ~/.zshrc
