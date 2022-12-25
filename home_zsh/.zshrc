autoload -U compinit promptinit
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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

# ADDONS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# THEME CUSTOMIZATION
export BULLETTRAIN_DIR_EXTENDED=2
# export SEGMENT_SEPARATOR=""
tty | grep -q tty
if [ $? ]
then
	export SEGMENT_SEPARATOR="󝒇 "
	export BULLETTRAIN_PROMPT_CHAR="%F{white}╰╴%F{green}󝒄 %F{white}╶─➤ "
else
	export SEGMENT_SEPARATOR=""
fi
export BULLETTRAIN_PROMPT_ORDER=( time status custom context dir screen perl ruby virtualenv aws go rust elixir git hg cmd_exec_time )

function prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 && $BULLETTRAIN_STATUS_EXIT_SHOW != true ]] && symbols+="󝒆 "
  [[ $RETVAL -ne 0 && $BULLETTRAIN_STATUS_EXIT_SHOW == true ]] && symbols+="󝒆 $RETVAL"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]]; then
    prompt_segment $BULLETTRAIN_STATUS_ERROR_BG $BULLETTRAIN_STATUS_FG "$symbols"
  elif [[ -n "$symbols" ]]; then
    prompt_segment $BULLETTRAIN_STATUS_BG $BULLETTRAIN_STATUS_FG "$symbols"
  fi

}

if [ -f /home/greg/repos/zsh-insulter/src/zsh.command-not-found ]; then
	. /home/greg/repos/zsh-insulter/src/zsh.command-not-found
fi

# turn off beep
unsetopt BEEP
unsetopt LIST_BEEP

# change editor
export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat

tty | grep -q tty
if [ $? -eq 0 ]; then;
	# set powerline font for tty
	setfont /media/hdd/fonts/psf/ter-powerline-v14n.psf.gz
	# ~/scripts/tty-mona-lisa.sh
else
	alias ls=lsd
	# alias lt="ls --tree"
	alias tree="ls --tree"
fi

# aliases
alias mv=mvg
alias cp=cpg
alias mutt=neomutt
alias vim=nvim
alias clear="/usr/bin/clear; ls"
# alias yay="yay --pacman powerpill"
alias zrc="nvim ~/.zshrc"
alias bsprc="nvim ~/.config/bspwm/bspwmrc"
alias sync-repos="~/scripts/sync-repos.sh"
alias wttr="curl wttr.in"
alias gdremount="screen -dm gcsf mount /media/gdrive -s yagreg7drive"
alias la="ls -la"
alias "youtube-dl"="youtube-dl -i --external-downloader axel --external-downloader-args \"-a\""
# alias "godot_steam"="$HOME/.local/share/Steam/steamapps/common/Godot\ Engine/godot.x11.opt.tools.64"
alias neofetch="neofetch --source ~/.neofetch-logo.txt"
function pastream {
	case "$1" in
		start)
			$0 stop
			pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=pastream record=true port=8000
			;;
		stop)
			pactl unload-module $(pactl list | grep tcp -B1 | grep M | sed 's/[^0-9]//g')
			;;
		*)
			echo "Usage: $0 start|stop"
			;;
	esac
}

function md2pdf {
	pandoc --pdf-engine=xelatex -V mainfont="Liberation Serif" -V monofont="Iosevka" -V geometry:margin=.5in $1 -o $2
}

function lock {
	# Make new terminals open in this directory
	echo "`pwd`" > ~/.dirlock
}

function rel {
	# Release the lock
	rm ~/.dirlock
}

[ -f ~/.dirlock ] && cd `cat ~/.dirlock`

# WIDGETS
function _clear-ls {
	clear
	zle accept-line
}
zle -N _clear-ls
bindkey ^L _clear-ls

function _bookmarks {
	cd $(cat ~/.bookmarks | fzf)
	clear
	zle accept-line
}
zle -N _bookmarks
bindkey ^F _bookmarks

# HOOKS
add-zsh-hook -Uz chpwd() { ls; } 

# BULLETTRAIN COLORS
BULLETTRAIN_DIR_FG=black

# DESKTOP
D_BACKGROUND="$HOME/pictures/wal/cavej.jpg"

# FANCY-NANCY GREETINGS
screen -dm aplay ~/dotfiles/pop.wav -q 
DAY=$(date "+%_d")
echo -e "$(echo 'Hi , '$USER' !   : )' | figlet)\n\n$(cal -m -3 | sed s/\ $DAY\ /\[$DAY\]/g | sed s/\ $DAY$/\[$DAY\]/g | sed s/^$DAY\ /\[$DAY\]/g)\n$(date +'%H : %M : %S' | figlet)" | lolcat
ls

if ! [ -z "$USE_CONDA" ]; then

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function _conda_activate {
	NEWENV=$(conda env list | sed '1,2d' | awk '{print $1}' | fzf)
	conda activate $NEWENV
	zle accept-line
}
zle -N _conda_activate
bindkey ^Y _conda_activate

else # NOT USE_CONDA

function _condarun {
	RBUFFER="USE_CONDA=1 zsh" # For some reason, just putting 'USE_CONDA=1 zsh' in the function doesn't work
	zle accept-line
}
zle -N _condarun
bindkey ^Y _condarun

fi
