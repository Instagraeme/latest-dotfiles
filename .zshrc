# Enable Profiling
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH. export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

if ! nvim_loc="$(type -p "$nvim")" || [[ -z $nvim_loc ]]; then
  alias nano='nvim'
  alias vim='nvim'
  export EDITOR='nvim'
elif ! vim_loc="$(type -p "$vim")" || [[ -z $vim_loc ]]; then
  alias nano='vim'
  export EDITOR='vim'
else
  alias nano='vi'
  export EDITOR='vi'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases

alias myip="curl http://ipecho.net/plain; echo"
alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias hs='history | grep'
alias mkcd='mkcd_func(){ mkdir -p "$1"; cd "$1" }; mkcd_func'
alias rmdir='rm -rf $1'
alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias icloud="cd /Users/graeme/Library/Mobile\ Documents/com~apple~CloudDocs"
alias server="ssh server"

if ! exa_loc="$(type -p "$exa")" || [[ -z $exa_loc ]]; then
	alias ls='exa -l --icons -g -a --header'
elif ! colorls_loc="$(type -p "$colorls")" || [[ -z $colorls_loc ]]; then
	alias ls="colorls --sd -Al"
else
	alias ls="ls -l"
fi

plugins=(git colored-man-pages colorize z)

case `uname` in
  Darwin)
    # commands for OS X go here
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	if type brew &>/dev/null; then
		FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    		autoload -Uz compinit
		for dump in ~/.zcompdump(N.mh+168); do
    			compinit
		done
		compinit -C
  	fi
	plugins+=(brew)
	;;
  Linux)
	alias update='apt update && apt -y upgrade && apt autoremove && apt autoclean'
	plugins+=(docker)
  ;;
esac


# End profiling

# zprof
