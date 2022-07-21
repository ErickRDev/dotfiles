#!/usr/bin/env bash

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "/opt/google/chrome" ] ; then
  PATH="/opt/google/chrome/:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.gem/ruby/2.6.0/bin" ]; then
  PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$PATH:/$HOME/.cargo/bin"
fi

if [ -d "/usr/local/go/bin" ] ; then
  PATH="$PATH:/usr/local/go/bin:/$HOME/go/bin"
fi

[ -f "/home/archer/.ghcup/env" ] && source "/home/archer/.ghcup/env" # ghcup-env

SERVICE='ssh-agent'
WHOAMI=`whoami |awk '{print $1}'`

if pgrep -u $WHOAMI $SERVICE >/dev/null
then
  echo $SERVICE running.
else
  echo $SERVICE not running.
  echo starting

  eval `ssh-agent -s`

  if [ -f "$HOME/.ssh/github.pem" ] ; then
    ssh-add ~/.ssh/github.pem
  fi
fi

if [ -f "$HOME/.bashrc" ] ; then
  . "$HOME/.bashrc"
fi

export DOTFILES_HOME="$HOME/.dotfiles"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
