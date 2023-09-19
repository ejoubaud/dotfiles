#!/bin/sh

# Start by installing homebrew, whether on MacOS or Linux

RECIPES=(git tmux tree sl ctags ag lazygit git-delta asdf gh vim fzf zsh)

# Install Homebrew
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
