#!/bin/sh

stow -R -t ~ home_*

ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
