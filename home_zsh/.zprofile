# turn off beep
unsetopt BEEP
unsetopt LIST_BEEP

# change editor
export EDITOR=nvim
export VISUAL=nvim
# Use bat for man pages
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# Set XDG env vars
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# bullettrain colors
export BULLETTRAIN_DIR_FG=black

# QT style
# export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=0 # fix qBitTorrent scale (?)

# desktop customization
export TERMINAL=alacritty
export MOD=super
export D_BACKGROUND="$HOME/pictures/wal/cavej.png"
export D_BACKGROUND_MASK="$HOME/pictures/wal/1_mask.png"

# Vulkan on AMD
export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/radeon_icd.x86_64.json:/usr/share/vulkan/icd.d/radeon_icd.i686.json"

# Gamemode PRIME offload
# export GAMEMODERUNEXEC="env __NV_PRIME_RENDER_OFFLOAD=1 env __GLX_VENDOR_LIBRARY_NAME=nvidia env __VK_lAYER_NV_optimus=NVIDIA_only"

# Sync to the main monitor
export __GL_SYNC_DISPLAY_DEVICE="DisplayPort-2"

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

# GTK theme
export GTK_THEME=amarena

# Add HIP to path
export PATH=$PATH:/opt/rocm/bin/:$GOPATH/bin

# ssh-agent
# eval $(ssh-agent -s) > /dev/null

# Better cursor size
export XCURSOR_SIZE=32

# Alacritty: constant scaling factor
export WINIT_X11_SCALE_FACTOR=1

# Password storage
export PASSWORD_STORE_DIR=~/.password-store

# Proxies!!!
export http_proxy=http://localhost:3128
export https_proxy=http://localhost:3128
export ftp_proxy=http://localhost:3128

# Accesibility for hints
export ACCESSIBILITY_ENABLED=1
export GTK_MODULES=gail:atk-bridge
export OOO_FORCE_DESKTOP=gnome
export GNOME_ACCESSIBILITY=1
export QT_ACCESSIBILITY=1
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1

# Per-host configuration
H_PROFILE=$HOME/dotfiles/hosts/$(cat /proc/sys/kernel/hostname)/zprofile
[ -f $H_PROFILE ] && source $H_PROFILE
