#!/bin/sh

# Ubuntu-only stuff. Abort if not Linux.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Linux ]] || return 1

# requirement for tmux-yank
sudo apt-get install xsel

# Nothing for now, this is just a placeholder
