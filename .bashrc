
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=vim

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color -n'

# Stored old PS1 in case I might want it
# PS1='[\u@\h \W]\$ '

PS1='[Mysa: \W]\$ '

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/samy.hussaein/.vimpkg/bin"
