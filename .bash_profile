#!/usr/bin/env bash

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$PATH:/$HOME/.cargo/bin"
fi

if [ -d "/usr/local/go/bin" ] ; then
  PATH="$PATH:/usr/local/go/bin:/$HOME/go/bin"
fi

SERVICE='ssh-agent'
WHOAMI=`whoami |awk '{print $1}'`

if pgrep -u $WHOAMI $SERVICE >/dev/null
then
  echo $SERVICE running.
else
  echo $SERVICE not running.
  echo starting

  eval `ssh-agent -s`

  if [ -f "$HOME/.ssh/github" ] ; then
    ssh-add ~/.ssh/github
  fi
fi

if [ -f "$HOME/.bashrc" ] ; then
  . "$HOME/.bashrc"
fi

export DOTFILES_HOME="$HOME/.dotfiles"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
