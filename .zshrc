#!/bin/bash

for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/usr/local/share/npm/bin:$HOME/bin:/usr/local/bin:$PATH"

# go-lang
export PATH="$GOPATH/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# powerline config
DISABLE_AUTO_TITLE="true"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="white"
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6'
POWERLEVEL9K_TIME_FORMAT="%D{ %H:%M:%S \uf017}"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm virtualenv_joined rbenv_joined background_jobs_joined battery_joined time_joined)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="white"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

# ZSH (Oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-extras git-flow osx heroku rsync tmux npm node virtualenv virtualenvwrapper)
source $ZSH/oh-my-zsh.sh
