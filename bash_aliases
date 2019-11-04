#!/bin/bash
# reload bashrc and subsequently bash_aliases
alias bashreload="source ~/.bashrc && echo 'Bash config reloaded: current version: ${BASHRC_VERSION}'"
alias bashv="echo 'Current version ${BASHRC_VERSION}'"

alias updatedot="cd ~/git/dotfiles && git pull && ./install && bashreload && cd -"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# pp - Useful for brace expansion to a file
# i.e pp host{1..4}-{1,2}.example.com outputs
# 
# host1-1.example.com
# host1-2.example.com
# host2-1.example.com
# host2-2.example.com
# host3-1.example.com
# host3-2.example.com
# host4-1.example.com
# host4-2.example.com
alias pp='printf "%s\n"'

# Docker Compose
alias dcl="docker-compose logs -f"
alias dcp="docker-compose pull"
alias dcr="docker-compose restart"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"

# Make parent directories automatically
alias mkdir="mkdir -pv"

# Make mount output human readable
alias mount="mount | column -t"

# Show my open ports
alias ports="netstat -tulanp"

# Prevent changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Find processes as argument
# usage: psg bash
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Find things here
alias fhere="find . -name "
