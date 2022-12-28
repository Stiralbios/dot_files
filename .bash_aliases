# Choose the default editor
export EDITOR=emacs
export VISUAL=emacs

# Choose the history size
export HISTSIZE=10000
export HISTFILESIZE=10000

# Keep history for all terminals
export PROMPT_COMMAND='history -a'

# Pager for color in man and other commands
export PAGER="most"

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias multitail='multitail --no-repeat -c'
alias emacs='emacs -nw'

# Remove files created by editors
alias clean='rm -f "#"* "."*~ *~'
alias pyclean='find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete'

# recursive find alias
alias findrec='find . -name'

# now if you are in a screen
alias screenname='echo $STY'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Git related
alias gitperso="GIT_SSH_COMMAND='ssh -i /home/astyan/.ssh/perso -o IdentitiesOnly=yes' git"
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gm='git merge'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# Python
alias venv_activate="source ./venv/bin/activate"

# Search running processes
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Alias's for dns
alias dnscache_flush='resolvectl flush-caches'
alias dnscache_stats='resolvectl statistics'

# Alias's for pulseaudio
alias pulseaudio_restart='pulseaudio -k'

# Add vpn alias
alias add_openvpn='sudo nmcli connection import type openvpn file'

# get the column passed in args
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

#network
alias external_ip="curl -s https://httpbin.org/anything | jq -r '.origin'"

# Personnalize the prompt

# The various escape codes that we can use to color our prompt.
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
DARK_GRAY="\[\e[30m\]"
COLOR_NONE="\[\e[0m\]"

# determine git branch name
function parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# determine mercurial branch name
function parse_hg_branch(){
  hg branch 2> /dev/null | awk '{print " (" $1 ")"}'
}

# Determine the branch/state information for this git repository.
function set_git_branch() {
  # Get the name of the branch.
  branch=$(parse_git_branch)
  # if not git then maybe mercurial
  if [ "$branch" == "" ]
  then
    branch=$(parse_hg_branch)
  fi
  # remove the first space
  branch="${branch:2:-1}"

  # Set the final branch string.
  if [ "$branch" != "" ]
  then
    BRANCH="${DARK_GRAY}(${PURPLE}${branch}${DARK_GRAY})${COLOR_NONE}"
  else
    BRANCH=""
  fi
}
 
# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="${BLUE}\$${COLOR_NONE}"
  else
      PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
  fi
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${DARK_GRAY}[${PURPLE}`basename \"$VIRTUAL_ENV\"`${DARK_GRAY}]${COLOR_NONE}"
  fi
}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  set_git_branch

  # Set the bash prompt variable.
  PS1="${PYTHON_VIRTUALENV}${YELLOW}\u${DARK_GRAY}@${BLUE}\h${DARK_GRAY}:${GREEN}\W${COLOR_NONE}${BRANCH}${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt


if [ -f ~/.bash_aliases_leakid ]; then
    . ~/.bash_aliases_leakid
fi

if [ -f ~/.bash_aliases_procsea ]; then
    . ~/.bash_aliases_procsea
fi
