# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="honukai" # dstufft
export CLICOLOR=1
export PATH=/usr/local/sbin:$PATH
export EDITOR=vim
export NVM_DIR=~/.nvm
export POD_LOCAL_HOME=~/BC

# android/react-native
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

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

source $(brew --prefix nvm)/nvm.sh

# Symlink diff-highlight to .bin so it's in the path
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" ~/.bin/diff-highlight

# AWS tools completion
# source /usr/local/share/zsh/site-functions/_aws

# https://github.com/lalitkapoor/nvm-auto-switch
# source /usr/local/opt/nvm-auto-switch/nvm-auto-switch.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Symlink hub to git
eval "$(hub alias -s)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'
