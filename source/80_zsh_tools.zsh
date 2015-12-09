#!/bin/zsh

unsetopt correct_all
export TERM='xterm-256color'
# Make ctrl+P and N (emacs up and down) behave the same as up and down arrow for completion
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

