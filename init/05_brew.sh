#!/bin/sh

# Start by installing homebrew, whether on MacOS or Linux

RECIPES=(git tmux tree sl ctags the_silver_searcher lazygit git-delta asdf gh vim fzf zsh)

# Install Homebrew
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  BREW_PREFIX=/opt/homebrew
  [[ -d /home/linuxbrew/.linuxbrew ]] && BREW_PREFIX=/home/linuxbrew/.linuxbrew
  eval "$($BREW_PREFIX/bin/brew shellenv)"
fi

if [[ "$(type -P brew)" ]]; then
  e_header "Updating Homebrew"
  brew update

  # Install Homebrew recipes.

  list="$(to_install "${RECIPES[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    e_header "Installing Homebrew recipes: $list"
    brew install $list
  fi
fi
