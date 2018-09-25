
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=vim

# Aliases
alias ls='ls --color'
alias grep='grep --color -n'
alias cmk='$HOME/Desktop/makefile.sh'
alias gdb='gdb -q'

LS_COLORS="di=1;33"
export LS_COLORS


# Color support for less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Stored old PS1 in case I might want it
# PS1='[\u@\h \W]\$ '

PS1='\n\e[1;31m\]mysa: \e[1;32m\]\W \e[1;35m\]\$\e[m\n>> '
