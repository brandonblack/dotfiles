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

# ZSH (Oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sorin"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-extras git-flow osx heroku rsync tmux npm node virtualenv virtualenvwrapper)
source $ZSH/oh-my-zsh.sh
