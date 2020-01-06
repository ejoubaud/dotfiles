#!/bin/sh

# Ensure oh-my-zsh is installed
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup zsh as the default shell
[[ $SHELL == */zsh ]] || sudo chsh -s /bin/zsh
