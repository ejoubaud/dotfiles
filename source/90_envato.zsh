#!/bin/zsh

# For envato's Boxen
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# Needed for AWS auto-scaling
export AWS_AUTO_SCALING_HOME="/opt/boxen/homebrew/Cellar/auto-scaling/1.0.61.6/libexec"
export JAVA_HOME="`/usr/libexec/java_home`"
