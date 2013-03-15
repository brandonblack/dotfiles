export PATH="/usr/local/share/npm/bin:$HOME/bin:$PATH"
export PATH="PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH""

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin

for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# ZSH (Oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git osx ruby rvm powder bundler heroku)
source $ZSH/oh-my-zsh.sh
