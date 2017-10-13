# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# override the theme...
ZSH_CUSTOM="$HOME/.dotfiles/themes"
ZSH_THEME=personal

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git-flow command-not-found compleat history-substring-search pip python fasd zsh-syntax-highlighting jsontools osx docker mvn gradle aws)

source $ZSH/oh-my-zsh.sh

setopt completeinword

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time
zstyle ':completion::complete:*' use-cache 1

# directory munging
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
rationalise-dot() {
if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# killing
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'

autoload select-word-style
select-word-style shell

# automatic upgrade...
DISABLE_UPDATE_PROMPT=true

alias ls='gls --group-directories-first --color=auto'
alias la='ls -al'
alias ll='ls -l'
alias dc='cd'
alias vi='vim -p'
alias mvim='mvim -p'
alias gvim='mvim'
alias sl='ls'
alias ssh='ssh -X'
alias pylab='ipython qtconsole --pylab=inline'

# code
alias -s cpp="vim -p"
alias -s hpp="vim -p"
alias -s java="vim -p"
alias -s c="vim -p"
alias -s h="vim -p"
alias -s txt="vim -p"

# Terminal colors
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

if [ -f ~/.dircolors ]; then
    eval `gdircolors ~/.dircolors`
fi

export EDITOR=vim
export CTEST_OUTPUT_ON_FAILURE=1

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
