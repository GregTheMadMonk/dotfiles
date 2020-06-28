# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/greg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# activate sytax highlighing
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# turn off beep
unsetopt BEEP
unsetopt LIST_BEEP

# change editor
export EDITOR=vim
export VISUAL=vim

# set powerline font for tty
tty | grep -q tty
if [ $? -eq 0 ]; then;
	setfont /home/greg/software/fonts/psf-powerline/ter-powerline-v14n.psf.gz

	# prompt repos update
	echo -n "Would You like to sync your repos? [yN]"
	read yn
	case $yn in
		[Yy]* )
			~/scripts/sync-repos.sh
			;;
		[Nn]* )
			echo Ok
			;;
		* )
			echo I\'ll take that as \'no\'
			;;
	esac
else
	alias ls=lsd
	# alias lt="ls --tree"
	alias tree="ls --tree"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export BULLETTRAIN_DIR_EXTENDED=2
alias mutt=neomutt
alias clear="clear; ls"
alias yay="yay --pacman powerpill"
alias zrc="vim ~/.zshrc"
alias sync-repos="~/scripts/sync-repos.sh"
alias wttr="curl wttr.in"
alias gdremount="screen -dm gcsf mount /media/gdrive -s yagreg7drive"
# alias neofetch="neofetch --source ~/arch_art.txt"
# alias ls=lsd

add-zsh-hook -Uz chpwd() { ls; } 

if [ -f /home/greg/repos/zsh-insulter/src/zsh.command-not-found ]; then
	. /home/greg/repos/zsh-insulter/src/zsh.command-not-found
fi

#echo "Hi, $USER!"$(date +"%d.%m.%Y") | lolcat
#date +"%H : %M : %S" | figlet | lolcat
screen -dm aplay ~/dotfiles/pop.wav -q 
DAY=$(date "+%_d")
echo -e "$(echo 'Hi , '$USER' !   : )' | figlet)\n\n$(cal -m -3 | sed s/\ $DAY\ /\[$DAY\]/g | sed s/\ $DAY$/\[$DAY\]/g | sed s/^$DAY\ /\[$DAY\]/g)\n$(date +'%H : %M : %S' | figlet)" | lolcat
ls
