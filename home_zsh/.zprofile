# turn off beep
unsetopt BEEP
unsetopt LIST_BEEP

# change editor
export EDITOR=nvim
export VISUAL=nvim

# bullettrain colors
export BULLETTRAIN_DIR_FG=black

# QT style
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=0 # fix qBitTorrent scale (?)

# desktop customization
export TERMINAL=alacritty
export MOD=super
export DBG="/home/greg/Pictures/MyWallpapers/earth.jpg"
export DBG_MASK="/home/greg/Pictures/MyWallpapers/1_mask.png"

# Android SDK
export ANDROID_SDK_ROOT="/home/greg/software/android-sdk-latest"
export PATH=$PATH:"/home/greg/software/NVPACK/android-sdk-linux/tools"
export ANDROID_HOME="/home/greg/software/NVPACK/android-sdk-linux"
export PATH=$PATH:"/home/greg/software/NVPACK/android-sdk-linux/platform-tools"
export PATH=$PATH:"/home/greg/software/NVPACK/android-sdk-linux/build-tools"
export PATH=$PATH:"/home/greg/software/NVPACK/android-sdk-linux/extras/android/support"
export PATH=$PATH:"/home/greg/software/NVPACK/android-ndk-r12b"
export NDK_ROOT="/home/greg/software/NVPACK/android-ndk-r12b"
export NDKROOT="/home/greg/software/NVPACK/android-ndk-r12b"
export NVPACK_NDK_VERSION="android-ndk-r12b"
export NVPACK_NDK_TOOL_VERSION="4.9"
export NDK_STANDALONE_46_ANDROID9_32="/home/greg/software/NVPACK/android-ndk-r12b/standalone-toolchain-32"
export NDK_STANDALONE_46_ANDROID9_64="/home/greg/software/NVPACK/android-ndk-r12b/standalone-toolchain-64"
export PATH=$PATH:"/home/greg/software/NVPACK/apache-ant-1.8.2/bin"
export ANT_HOME="/home/greg/software/NVPACK/apache-ant-1.8.2"
export PATH=$PATH:"/home/greg/software/NVPACK/gradle-2.9/bin"
export GRADLE_HOME="/home/greg/software/NVPACK/gradle-2.9"

# Use bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"

# whatever this is
export NVPACK_ROOT="/home/greg/software/NVPACK"

# Vulkan on Nvidia
export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/nvidia_icd.json"

# ssh-agent
# eval $(ssh-agent -s) > /dev/null
