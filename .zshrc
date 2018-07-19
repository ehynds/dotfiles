# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="honukai" # dstufft
export CLICOLOR=1
export PATH=/usr/local/sbin:$PATH
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
export EDITOR=vim
export NVM_DIR=~/.nvm
export POD_LOCAL_HOME=~/BC

# android/react-native
# export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Prevent homebrew from talking to Google Analytics
export HOMEBREW_NO_ANALYTICS=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git ruby brew node npm extract github)

source $ZSH/oh-my-zsh.sh

# speed up auto completion
COMPLETION_WAITING_DOTS="true"
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Load stuff
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
if [ -f ~/.functions ]; then
  source ~/.functions
fi
if [ -d ~/.bin ] ; then
  export PATH=$HOME/.bin:$PATH
fi
if [[ ! -e ~/.nvm ]]; then
  mkdir ~/.nvm
  cp ${0:h}/nvm/nvm.sh ~/.nvm
fi

PATH=$PATH:$HOME/.rvm/bin

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Symlink diff-highlight to .bin so it's in the path
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" ~/.bin/diff-highlight

# AWS tools completion
# source /usr/local/share/zsh/site-functions/_aws

# https://github.com/lalitkapoor/nvm-auto-switch
# source /usr/local/opt/nvm-auto-switch/nvm-auto-switch.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
