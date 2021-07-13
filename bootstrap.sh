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

echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

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
brew tap homebrew/cask

# Install applications
masapps=(
  409203825  # Numbers
  409201541  # Pages
  1333542190 # 1password
  803453959  # Slack
  904280696  # Things (3.13.13)
  1529448980 # Reeder (5.0.7)
  1451400394 # bookmarker for pinboard (1.11)
  1480068668 # Messenger (97.11.116)
  409183694  # Keynote (11.1)
  1437138382 # WhatFont (2.1.1)
  1460836908 # GoPro Player (1.3.2)
  405399194  # Kindle (1.31.0)
  1467460892 # PinButton (1.0)
  1147396723 # WhatsApp (2.2126.11)
  803453959  # Slack (4.17.0)
)

echo "> Install App Store applications..."
mas install "${masapps[@]}"

apps=(
  1password
  alfred
  arq
  bartender
  dropbox
  expressvpn
  google-chrome
  istat-menus
  moom
  notion
  soulver
  slack
  things
  spotify
  figma
  iterm2
)

echo "> Installing applications..."
brew install --cask "${apps[@]}"

qlmanage -r
qlmanage -r cache