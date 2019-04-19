
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=vim

# Aliases
alias ls='ls --color'
alias ll='ls -al'
alias grep='grep --color -n'
alias cmk='$HOME/Desktop/makefile.sh'
alias gdb='gdb -q'
alias gxx='g++ -Wall -Werror -Wextra -pedantic -std=c++17'

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
export PATH=$PATH:$HOME/.local/bin/
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

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

#   ---- ---- ---- ---- ---- ----    Colors:   ---- ---- ---- ---- ---- ----

DEFAULT_COLOR="\e[39m"
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"
DARK_GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"
WHITE="\e[97m"

__get_last_exit_value() {
    local exit_value="$?"
    if [ $exit_value != 0 ]; then
        exit_value="${RED}[${exit_value}]${DEFAULT_COLOR}"      # Add red if exit code non 0
    else
        exit_value="${LIGHT_GREEN}[${exit_value}]${DEFAULT_COLOR}"      # Add green if exit code is 0
    fi
    echo "$exit_value"
}

# get current branch in git repo
function parse_git_branch()
{
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty
{
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

__get_PS1()
{
    local EXIT="$(__get_last_exit_value)" # Has to before any call to evaluate

    PS1="\n${EXIT} "
    PS1+="\[\e[30;41m\] Mysa \[\e[m\]\[\e[31;42m\]▶\[\e[m\]\[\e[30;42m\] \[\e[m\]\[\e[30;42m\]\W\[\e[m\]\[\e[42m\] \[\e[m\]\[\e[32;43m\]▶\[\e[m\]\[\e[43m\] \[\e[m\]\[\e[30;43m\]\`parse_git_branch\`\[\e[m\]\n>> "
}

__prompt_command() {
    __get_PS1
}

PROMPT_COMMAND=__prompt_command # Gets called before initializing PSs

eval `ssh-agent -s` > /dev/null
ssh-add $HOME/.ssh/git_perso > /dev/null
reset
echo "Glad to see you Mysa"
curl wttr.in/Paris > TMP_W 2> /dev/null
sed -i '1s/.*/Here is the actual weather : /' TMP_W
cat TMP_W | head -n 7
rm TMP_W
