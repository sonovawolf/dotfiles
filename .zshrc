# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  alias-finder
)

source $ZSH/oh-my-zsh.sh

# Aliases

# Git
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Open this file
alias zshconfig='code ~/.zshrc'

# Tailscale utils
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias dev-tailscaled="go run tailscale.com/cmd/tailscaled --tun=userspace-networking --socket=/tmp/ts/ts.sock --state=/tmp/ts/ts.state"
alias dev-tailscale="go run tailscale.com/cmd/tailscale --socket=/tmp/ts/ts.sock up --login-server=http://localhost:31544"
alias dev-tailscale-build="go run ./cmd/tailcontrol --dev --generate-test-devices=small"
alias dev-alt-tailscaled="go run tailscale.com/cmd/tailscaled --tun=userspace-networking --socket=/tmp/ts/ts2.sock --state=/tmp/ts/ts2.state"
alias dev-alt-tailscale="go run tailscale.com/cmd/tailscale --socket=/tmp/ts/ts2.sock"

autoload -U promptinit; promptinit
prompt pure

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
