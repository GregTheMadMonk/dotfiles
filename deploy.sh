#!/bin/sh

THEME="$1"
if [ "$THEME" = "" ]; then
	echo No theme specified
	exit 1;
fi

echo Using theme $THEME
echo Using stow to deploy not theme-specific dotfiles...
echo "~/ subfolders"
stow -R -t ~ home_* --override=* --verbose=0
echo "/usr subfolders (requires sudo)"
sudo stow -R -t /usr usr_* --override=* --verbose=0

echo Using stow to deploy theme-specific dotfiles...
echo "~/ subfolders"
stow -R -t ~ "$THEME"_home_* --override=* --verbose=0
echo "/usr subfolders (requres sudo)"
sudo stow -R -t /usr "$THEME"_usr_* --override=* --verbose=0

echo Creating additional symlinks...
echo "~/.tmux.conf -> ~/.tmux/.tmux.conf..."
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
echo "~/.tmux.conf.local -> ~/.tmux.conf.local..."
ln -s ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
