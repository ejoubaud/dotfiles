#!/bin/sh

# Ubuntu-only stuff. Abort if not Linux.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Linux ]] || return 1

# Nothing for now, this is just a placeholder
