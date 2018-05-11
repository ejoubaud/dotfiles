#!/bin/zsh

# For envato's Boxen
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# For disco gem, so we don't have to install it everywhere
alias disco="RBENV_VERSION=2.3.3 aws-vault exec discovery -- disco"
