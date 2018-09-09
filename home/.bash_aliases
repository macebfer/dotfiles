#! /bin/bash
###################
# ~/.bash_aliases
###################

alias a2='aria2c'
alias back='cd ${OLDPWD}'
alias c='cat'
alias cd....='cd ../../..'
alias cd...='cd ../..'
alias cd..='cd ..'
alias clean='find . \( -name "*~" -or -name "*.bak" \) -exec rm -vf {} \;'
alias clean_vim='rm -rf ~/.vim/swp/*'
alias cls='clear'
alias cp='cp -v'
alias desktop='cd ${HOME}/Desktop'
alias dfe='df -kTha --sync'
alias dush='du -skh --time'
alias f='file'
alias grep='grep --color'
alias hgrep='history | sed s/\ \ .*\ \ // | grep'
alias home="cd ${HOME}"
alias hsync='history -a && history -n'
alias infomount='mount | column -t 2>/dev/null'
alias ipconfig='ifconfig'
alias isomount='mount -t iso9660 -o ro,loop'
alias lsiso="isoinfo -l -i"
alias m="${PAGER}"
alias md='mkdir -v'
alias merge='rsync -avWhP'
alias mkdate='mkdir $(date +%Y%m%d)'
alias mkdir='mkdir -v'
alias mute='amixer -q set Master toggle'
alias mv='mv -v'
alias myip="wget -q -O - checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias path='echo -e ${PATH//:/\\n}'
alias pause='read -n 1 -p "Press any key to continue..."'
alias pdate='date +"  %A, %d de %B de %Y"'
alias psa='ps gauxwww'
alias psf='ps axf'
alias psm="ps gauxwwwf | ${PAGER}"
alias psp='ps -A o pid,comm,args,pcpu,size,state'
alias pstree='pstree -l'
alias rd='rmdir -v'
alias reload='source ${HOME}/.bash_profile && history -a && history -n'
alias rm='rm -v --preserve-root'
alias rmdir='rmdir -v'
alias rsynce='rsync -avhzP'
alias scp='scp -rp'
alias search='find . | grep -i'
alias sudo='sudo '
alias ssync='sync && sleep 0.25 && sync && sleep 0.25 && sync && sleep 0.25 && sync'
alias t='tar xvfa'
alias tattach='tmux attach'
alias tls='tmux ls'
alias tstatus='tmux set-option status'
alias unmute='amixer set Master 80% unmute && amixer set PCM 80% unmute'
alias w0='watch --interval 0'
alias w1='watch --interval 1'
alias w5='watch --interval 5'
alias wsensors='watch --interval 0 sensors'

# enable color support of ls and also add handy aliases
if [ "$TERM" != 'dumb' ]; then
  eval "$(dircolors --bourne-shell)"
  alias ls='ls --color=auto --group-directories-first'
# alias ls='ls --color=auto'
  alias lm="ls -lhA --color=always | $PAGER"
  alias lmr="ls -lhR --color=always | $PAGER"
else
  alias lm="ls -lhA | $PAGER"
  alias lmr="ls -lhR | $PAGER"
fi

# The 'ls' family
alias l1='ls -1 --color=never'
alias ll='ls -lh'
alias l='ll'
alias la='ls -lhA'               # show hidden and regular files
alias lx='ls -lhXB'              # sort by extension
alias lk='ls -lhSr'              # sort by size
alias lc='ls -lhcr'              # sort by change time
alias lu='ls -lhur'              # sort by access time
alias lt='ls -lhtr'              # sort by date
alias dir='ls -lhd */'
### EOF
