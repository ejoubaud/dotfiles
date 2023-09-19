#!/bin/sh

# Ensure oh-my-zsh is installed
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add zsh-autosuggestion
CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
AUTOSUGGESTION_DIR="$CUSTOM_DIR/plugins/zsh-autosuggestions"
[[ -d "$AUTOSUGGESTION_DIR" ]] || git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGESTION_DIR"

# Setup zsh as the default shell
[[ $SHELL == */zsh ]] || sudo chsh -s $(which zsh)
