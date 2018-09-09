### ~/.bashrc
#############

# If not running interactively: exit immediately.
# Note that 'return' works because the file is sourced, not executed.
if [[ $- != *i* ]] || [ -z "$PS1" ]; then
    return 0
fi

mesg n

# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

if [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
fi

# Security: close root shells after n seconds of inactivity
[ "$UID" = 0 ] && export TMOUT=300

# bash history will save 10000 commands
export HISTSIZE=10000
export HISTFILESIZE=1048576

# Variable de control del history
## ignorespace: Indica que no se guarde en el history los comandos que empiecen por un espacio.
## ignoredups: No guarda los comandos repetidos
## ignoreboth: Se trata de un alias para los dos parámetros anteriores: No escribe ni los comandos que empiezan por un espacio ni los que están duplicados.
## erasedups: Elimina los comandos duplicados esten en el orden que sean dejando siempre el último ejecutado.
export HISTCONTROL=ignorespace:ignoredups:ignoreboth:erasedups

export HISTIGNORE="[bf]g:exit:logout:clear:reboot:halt"
export HISTTIMEFORMAT="%Y/%m/%d %T "

# After each command, save and reload history
export PROMPT_COMMAND='history -a; history -c; history -r'

# shopt -s cdable_vars      # if cd arg is not valid, assumes its a var defining a dir
# shopt -s execfail         # Failed execs don't exit shell
# shopt -s expand_aliases   # expand aliases
# shopt -u force_fignore    # Expand to complete an ignored word, if no other words match.
shopt -s cdspell          # autocorrects cd misspellings
shopt -s checkwinsize     # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist          # save multi-line commands in history as single line
shopt -s dotglob          # include dotfiles in pathname expansion
shopt -s extglob          # enable extended pattern-matching features
shopt -s histappend       # append to (not overwrite) the history file
shopt -s histreedit       # allow re-editing of a history command substitution, if the previous run failed
shopt -s hostcomplete     # attempt hostname expansion when @ is at the beginning ofa word
shopt -s no_empty_cmd_completion    # Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s nocaseglob       # pathname expansion will be treated as case-insensitive

# set -o ignoreeof        # Stops ctrl+d from logging me out
# set -o noclobber        # prevent overwriting files with cat
# set -o nounset          # Treat undefined variables as errors
# set -o notify           # Don't wait for job termination notification

# regular colors
DEFAULT="\[\033[0m\]"   # standard terminal fg color
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"

# emphasized/bold colors
EM_BLACK="\[\033[1;30m\]"
EM_RED="\[\033[1;31m\]"
EM_GREEN="\[\033[1;32m\]"
EM_YELLOW="\[\033[1;33m\]"
EM_BLUE="\[\033[1;34m\]"
EM_MAGENTA="\[\033[1;35m\]"
EM_CYAN="\[\033[1;36m\]"
EM_WHITE="\[\033[1;37m\]"

# background colors
BG_BLACK="\[\033[40m\]"
BG_RED="\[\033[41m\]"
BG_GREEN="\[\033[42m\]"
BG_YELLOW="\[\033[43m\]"
BG_BLUE="\[\033[44m\]"
BG_MAGENTA="\[\033[45m\]"
BG_CYAN="\[\033[46m\]"
BG_WHITE="\[\033[47m\]"

PS1COLOR=$EM_GREEN

if [ "$UID" = 0 ]; then
  PS1COLOR=$EM_RED
fi

PS1="$EM_BLUE[\#] $PS1COLOR\u@\h:\w$PS1COLOR\$ $DEFAULT"

if [ -f /etc/chroot ]; then
    CHROOT_NAME=$(head --lines=1 /etc/chroot)
    PS1="$EM_BLUE[\#] $EM_YELLOW(${CHROOT_NAME}) $PS1COLOR\u@\h:\w$PS1COLOR\$ $DEFAULT"
elif [ ! -z "${SSH_CLIENT}" ]; then
    PS1="$EM_BLUE[\#] $EM_YELLOW(SSH) $PS1COLOR\u@\h:\w$PS1COLOR\$ $DEFAULT"
elif [ ${TERM} == "screen" ]; then
    PS1="${EM_BLUE}[\#] ${EM_YELLOW}(tmux) ${PS1COLOR}\u@\h:\w${PS1COLOR}\$ ${DEFAULT}"
fi

PS2="$PS1COLOR> $DEFAULT"
PS3="$PS1COLOR> $DEFAULT"
PS4="$PS1COLOR+ $DEFAULT"

export PS1 PS2 PS3 PS4

unset DEFAULT BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE
unset EM_BLACK EM_RED EM_GREEN EM_YELLOW EM_BLUE EM_MAGENTA EM_CYAN EM_WHITE
unset BG_BLACK BG_RED BG_GREEN BG_YELLOW BG_BLUE BG_MAGENTA BG_CYAN BG_WHITE

### Enable bash completion
##########################
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if (which less &>/dev/null); then
  export PAGER=less
  export LESS='FSRX'
  export LESSCHARSET='utf-8'
  export LESS_TERMCAP_mb=$'\E[01;31m'
  export LESS_TERMCAP_md=$'\E[01;31m'
  export LESS_TERMCAP_me=$'\E[0m'
  export LESS_TERMCAP_se=$'\E[0m'
  export LESS_TERMCAP_so=$'\E[01;44;33m'
  export LESS_TERMCAP_ue=$'\E[0m'
  export LESS_TERMCAP_us=$'\E[01;32m'
else
  export PAGER=more
fi

if (which lesspipe.sh &>/dev/null); then
  export LESSOPEN="| $(which lesspipe.sh) %s"
fi

if (which vim &>/dev/null); then
  export EDITOR=vim
  export VISUAL=vim
else
  export EDITOR=vi
  export VISUAL=vi
fi

if (which lynx &> /dev/null); then
  export BROWSER='lynx'
fi

if [ ! -z "${DISPLAY}" ]; then
  if (which chromium &> /dev/null); then
    export BROWSER='chromium'
  fi
  if (which gvim &> /dev/null); then
    export EDITOR='gvim'
  fi
fi

if (which grep &>/dev/null); then
  export GREP_COLOR='1;31'
fi

if [ "$(locale charmap 2>/dev/null)" = "UTF-8" ]; then
	stty iutf8
fi

### Java Config
###############
# echo "JAVA_HOME=/opt/java" >> /etc/environment
# echo "CLASSPATH=${JAVA_HOME}" >> /etc/environment
###################################################
if [ -d /opt/java ]; then
  export JAVA_HOME='/opt/java'
  export CLASSPATH=${JAVA_HOME}

  if ! (echo $PATH | grep -q "${JAVA_HOME}/bin") ; then
    export PATH=${JAVA_HOME}/bin:$PATH
  fi
fi

### Python Config
#################

if (which python3 &>/dev/null); then
  if [ -z ${PYTHONPATH+x} ]; then 
    export PYTHONPATH=$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))")
  else
    export PYTHONPATH=$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"):$PYTHONPATH
  fi
  export PYTHONSTARTUP="${HOME}/.pythonrc"
  export PYTHONIOENCODING='utf-8'
  export PYTHONDOCS='/usr/share/doc/python/html/'
fi
# add user base to python path

### Ruby Config
###############
export RUBYOPT="rubygems"

### Backup directory for vim
###########################
if [ ! -d ${HOME}/.vim/backup ]; then
  $(which mkdir) -p ${HOME}/.vim/backup
fi

if [ ! -d ${HOME}/.vim/tags ]; then
  $(which mkdir) -p ${HOME}/.vim/tags
fi

if [ ! -d ${HOME}/.vim/swap ]; then
  $(which mkdir) -p ${HOME}/.vim/swap
fi

### QT Config
#############

QT_HOME='/opt/qtsdk'

if [ -d ${QT_HOME} ]; then
  if ! (echo $PATH | grep -q "${QT_HOME}/bin") ; then
    export PATH=${QT_HOME}/bin:$PATH
  fi

  if ! (echo $PATH | grep -q "${QT_HOME}/qt/bin") ; then
    export PATH=${QT_HOME}/qt/bin:$PATH
  fi
fi

unset QT_HOME


### Alias definitions
#####################
if [ -f "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi

### Local Environment Definitions
#################################
if [ -f "${HOME}/.bash_local_environment" ]; then
    source "${HOME}/.bash_local_environment"
fi

### Modern GTK apps enable Xft by default but this
### was not the case in older GTK and QT applications
export GDK_USE_XFT=1
export QT_XFT=true

### EOF

