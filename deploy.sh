#!/bin/sh

# dotfiles that must be copied to ~/
echo Using stow to deploy dotfiles...
stow -R -t ~ home_*

echo Creating additional symlinks...
echo "~/.tmux.conf -> ~/.tmux/.tmux.conf..."
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
echo "~/.tmux.conf.local -> ~/.tmux.conf.local..."
ln -s ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
