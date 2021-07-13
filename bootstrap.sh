#!/usr/bin/env bash

###############################################################################
# Based on https://github.com/rosszurowski/dotfiles/                          #
###############################################################################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "> Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(which brew); then
  echo ""
  echo "> Homebrew install failed! Try again manually by running"
  echo "> ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
  echo ""
fi

# Update homebrew recipes
brew update

# Install useful binaries
binaries=(
  awscli
  fzf
  git
  mas
  shellcheck
  ssh-copy-id
  wget
  zsh
)

echo "> Installing useful binaries..."
brew install "${binaries[@]}"

# Install node
echo "> Installing node..."
brew install node

# Some npm defaults
npm config set init-license "MIT"
npm config set init-version "0.0.1"

# Install Oh My Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install Pure prompt
npm install --global pure-prompt

# Install brew cask
echo "> Installing brew cask..."
brew tap caskroom/cask

# Install applications
masapps=(
  409183694  # Keynote
  409203825  # Numbers
  409201541  # Pages
  1333542190 # 1password
  803453959  # Slack
  413965349  # Soulver
  880001334  # Reeder
)

echo "> Install App Store applications..."
mas install "${masapps[@]}"

apps=(
  1password
  alfred
  arq
  atom
  backblaze
  bartender
  dropbox
  expressvpn
  google-chrome
  istat-menus
  moom
  notion
  spotify
)

echo "> Installing applications..."
brew cask install --appdir="/Applications" "${apps[@]}"

echo "> Installing QuickLook plugins..."
brew cask install "${qlplugins[@]}"

qlmanage -r
qlmanage -r cache