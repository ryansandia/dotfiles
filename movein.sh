#!/bin/sh
 for file in *; do
     ln -s $HOME/.dotfiles/$file $HOME/.$file
 done
