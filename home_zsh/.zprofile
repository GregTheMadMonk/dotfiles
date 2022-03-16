# turn off beep
unsetopt BEEP
unsetopt LIST_BEEP

# change editor
export EDITOR=nvim
export VISUAL=nvim

# Set XDG env vars
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# bullettrain colors
export BULLETTRAIN_DIR_FG=black

# QT style
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=0 # fix qBitTorrent scale (?)

# desktop customization
export TERMINAL=alacritty
export MOD=super
export D_BACKGROUND="$HOME/pictures/wal/cavej.png"
export D_BACKGROUND_MASK="$HOME/pictures/wal/1_mask.png"

# Use bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Vulkan on Nvidia
export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/nvidia_icd.json"

# Gamemode PRIME offload
# export GAMEMODERUNEXEC="env __NV_PRIME_RENDER_OFFLOAD=1 env __GLX_VENDOR_LIBRARY_NAME=nvidia env __VK_lAYER_NV_optimus=NVIDIA_only"

# Set GO path
export GOPATH="$XDG_DATA_HOME/go"

# Remove gnupg from $HOME
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Set default Wine prefix
export WINEPREFIX="$XDG_DATA_HOME/wine"

# Disable less history file
export LESSHISTFILE="-"

# Make Android Studio Work on tiling WMs
export _JAVA_AWT_WM_NONREPARENTING=1

# ssh-agent
# eval $(ssh-agent -s) > /dev/null
