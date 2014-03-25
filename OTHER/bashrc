# .bashrc

# User specific aliases and functions
alias c='clear'

# ls
alias ls='ls -hF --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias l='ls'

# modified commands
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias up='cd ..'
alias u='up'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias psg='ps -Af | grep $1'         # requires an argument
alias fhn='find . -iname'

alias g='git status'
alias rmtemp='rm *~'
alias s='/u/eu/be/gnanda/Downloads/Sublime\ Text\ 2/sublime_text'

# Sudo commands
alias svim='sudo vim'

# Pacman Aliases
alias update='sudo packer -Syyu'
alias install='sudo packer -S'
alias pacsearch='packer -Ss'

# Git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

mesg n

fortune | cowsay -f tux
