#!/bin/bash
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
alias dcr="docker-compose restart"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
