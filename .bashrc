
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

# Stored old PS1 in case I might want it
# PS1='[\u@\h \W]\$ '

PS1='\n\e[1;31m\]mysa: \e[1;32m\]\W \e[1;35m\]\$\n\e[1;32m\]>>\e[m '
