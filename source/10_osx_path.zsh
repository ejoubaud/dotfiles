#!/bin/zsh

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# go
export GOPATH=~/.go
export GOBIN=$GOPATH/bin
path+=($GOBIN)

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

#nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
