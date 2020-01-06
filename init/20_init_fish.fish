#!/bin/bash

# Install fisher (fish package manager)
# as per https://github.com/jorgebucaran/fisher/blob/6d2d410/README.md
if [[ ! -f ~/.config/fish/functions/fisher.fish ]]; then
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  # Install packages from fisherfile
  fish -c fisher
fi

# Switch to fish
# if [[ "$SHELL" != *fish ]]; then
#   bin=$(which fish)
#   # add to /etc/shells
#   grep -q $bin /etc/shells || echo $bin | sudo tee -a /etc/shells > /dev/null
#   # change default shell to fish
#   chsh -s $bin
#   # start running fish
#   fish
# fi
