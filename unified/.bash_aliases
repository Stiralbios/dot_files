# Choose the default editor
export EDITOR=emacs
export VISUAL=emacs

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


# get the column passed in args
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

# network
alias external_ip="curl -s https://httpbin.org/anything | jq -r '.origin'"

# docker
alias docker_purge="docker system prune -a && docker volume prune"

# env
function loadenv() {
    if [ -z "$1" ]; then
        echo "Usage: loadenv <config-file>"
        return 1
    fi
    set -o allexport   # Enable exporting all variables
    source "$1"        # Source the config file passed as argument
    set +o allexport   # Disable automatic exporting
}


# Load pyenv automatically
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# export PATH="$HOME/.local/bin:$PATH"


# eval "$(direnv hook bash)"
