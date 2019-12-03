#!/bin/zsh

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# anyenv
if type anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi
