#!/bin/zsh

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# node
path+=/Users/ejoubaud/node_modules/.bin

