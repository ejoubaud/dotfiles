#!/bin/zsh

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# node
path+=/usr/local/share/npm/bin

