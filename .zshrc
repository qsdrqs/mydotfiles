# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
setopt nonomatch
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/qsdrqs/.oh-my-zsh"

#Make alacritty compatible with SSH
export TERM="xterm-256color"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(
vi-mode
pip
alias-finder
systemd
#提供tmux的alias
tmux
git
colored-man-pages
#使ccat和cless有色彩
colorize
github
autojump
zsh-autosuggestions
#zsh-syntax-highlighting
fast-syntax-highlighting
#autopep8
#python
#替代find命令
fd

#fzf-tab可替代
#zsh-interactive-cd

#像ubuntu一样提示要安装的软件包
command-not-found
#找文件
fzf
fzf-tab
)
#set -o vi
source $ZSH/oh-my-zsh.sh

ZSH_COLORIZE_STYLE="colorful"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"

export FZF_BASE=/usr/share/fzf
export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -l -g ""'
export QT_AUTO_SCREEN_SCALE_FACTOR=1

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
alias t="tmux"
alias sp="sudo pacman"
alias c="clear"
alias n="neofetch"
alias ra="ranger"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias vimplug="nvim ~/.vimrc.plugs"
alias prox="export http_proxy=http://127.0.0.1:1080\
&& export https_proxy=http://127.0.0.1:1080\
&& export all_proxy=http://127.0.0.1:1080
"
alias tra="~/translator/translator.py"
alias vim="nvim"
alias vimm="/usr/bin/vim"
alias vi="vim --cmd 'let g:vim_startup=1'"
#Turn off the touch pad 
#Sometimes system suspend will make touchpad unable to work, so it needs 3 times to make it work.
alias to="/sbin/trackpad-toggle.sh;/sbin/trackpad-toggle.sh;/sbin/trackpad-toggle.sh"
alias sshconfig="vim ~/.ssh/config"
alias ta="~/.vim/plugged/asynctasks.vim/bin/asynctask.py -f"

mkcd(){
    mkdir -p $1 && cd $1
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

#vi-mode
bindkey -v
bindkey -M viins '^L' vi-forward-char
bindkey -M viins '^H' vi-backward-char
bindkey -M vicmd 'L'  vi-forward-word-end
bindkey -M vicmd 'H'  vi-backward-word
bindkey -M vicmd '^w' vi-beginning-of-line
bindkey -M vicmd '^e' vi-end-of-line

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q'

KEYTIMEOUT=1
EDITOR=nvim 
export EDITOR

eval $(thefuck --alias)
# This speeds up pasting w/ autosuggest 
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
paste-init() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

paste-finish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit 
zstyle :bracketed-paste-magic paste-finish pastefinish

#To make zsh colorful by grc
[[ -s "/etc/grc.zsh"  ]] && source /etc/grc.zsh
alias ls='lsd'
unset LSCOLORS
unset LS_COLORS
