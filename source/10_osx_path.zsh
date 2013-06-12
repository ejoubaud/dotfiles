#!/bin/zsh

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# node
<<<<<<< Updated upstream
path+=$HOME/node_modules/.bin
=======
path+=(/Users/ejoubaud/node_modules/.bin /usr/local/share/npm/bin)

>>>>>>> Stashed changes
