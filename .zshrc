export PATH="/usr/local/share/npm/bin:$HOME/bin:/usr/local/bin:$PATH"
export PATH="PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH""

for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# ZSH (Oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sorin"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-extras git-flow osx rsync rails tmux npm node)
source $ZSH/oh-my-zsh.sh

# RVM
PATH=$PATH:$HOME/.rvm/bin
source "$HOME/.rvm/scripts/rvm"

