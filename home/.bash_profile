# ~/.bash_profile
#
# When Bash is invoked as an interactive login shell, or non-interactive shell
# with the '--login' option, it first reads and execute commands from /etc/profile,
# if that file exits. After reading that file, it looks for '~/.bash_profile',
# '~/.bash_login', and '~/.profile', in that order, and reads and executes commands
# from the first one that exits and is readable.
#
# When a login shell exits, Bash reads and executes commands from '~/.bash_logout',
# if it exists.
#
# When an interactive shell that is not a login shell is started, Bash reads
# and executes commands from ~/.bashrc, if that file exits.
#####################################################################################


# the default umask is set in /etc/login.defs
umask 0022

export HOSTFILE='/etc/hosts'

if [ -z ${HOME} ]; then
  export HOME=$(cd ~;pwd)
fi

if [ -d ${HOME}/Desktop ]; then
  export DESKTOP=$(cd ~/Desktop;pwd)
fi
# Configuring locales
# echo 'LC_ALL=en_GB.utf8' >> /etc/environment
# echo 'LANG=en_GB.utf8' >> /etc/environment
# echo 'en_GB.UTF-8 UTF-8' > /etc/locale.gen

export LC_ALL=en_GB.utf8
export LANG=en_GB.utf8

# Configure audio driver for SDL applications
# echo "SDL_AUDIODRIVER=alsa" >> /etc/environment
export SDL_AUDIODRIVER=alsa

# set PATH so it includes /usr/local/bin if it doesn't exists in the PATH
if ! (echo $PATH | grep -q '/usr/local/bin') ; then
    PATH=/usr/local/bin:"${PATH}"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  if ! (echo $PATH | grep -q "${HOME}/bin") ; then
    PATH="${HOME}/bin":"${PATH}"
  fi
fi

# set PATH so it includes user's private .bin if it exists
if [ -d "${HOME}/.bin" ] ; then
  if ! (echo $PATH | grep -q "${HOME}/.bin") ; then
    PATH="${HOME}/.bin":"${PATH}"
  fi
fi

# set PATH so it includes user's private .local/bin if it exists
if [ -d "${HOME}/.local/bin" ] ; then
  if ! (echo $PATH | grep -q "${HOME}/.local/bin") ; then
    PATH="${HOME}/.local/bin":"${PATH}"
  fi
fi

# include .bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi

### EOF
