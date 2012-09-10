export PATH="$HOME/bin:$PATH"
export PATH="PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH""

for file in ~/.{exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# ZSH (Oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git osx ruby)
source $ZSH/oh-my-zsh.sh

# General
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export EDITOR="subl -w"
export ed="subl -w"

# RSpec
export AUTOFEATURE=true
export RSPEC=true

# Rails
export RAILS_ENV='development'