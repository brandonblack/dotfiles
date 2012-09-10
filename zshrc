# ZSH (Oh-my-zsh)
ZSH=$HOME/.zsh
ZSH_THEME="miloshadzic"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git osx ruby)
source $ZSH/oh-my-zsh.sh

# RSpec
export AUTOFEATURE=true
export RSPEC=true

# General
export PATH=/usr/local/bin:$PATH
export EDITOR="subl -w"
export ed="subl -w"

function dighost() { 
  host $(dig $1 | grep ANSWER -C 1 | tail -n 1 | awk '{ print $5 }')
}

# Rails
function rnew() {
  if [ $# -ne 1 ]
  then
    echo "Error! Application name expected."
  else
    mkdir "$1"; cd "$1";
    rvm --rvmrc --create use `rvm current`@"$1";
    gem install rails --no-rdoc --no-ri;
    rails new ../"$1";
    powder link;
  fi
}

# Git
function git-clean {
  git status --porcelain | \egrep '^D' | \sed -E -e 's/^D *//' -e 's/ /\\ /g' -e 's/^|$/"/g'
}

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin

function rvmrc() {
  if [ $# -ne 1 ]
  then
    rvm --rvmrc --create use `rvm current`@"${PWD##*/}";
  else
    rvm --rvmrc --create use `rvm current`@"$1";
  fi
}