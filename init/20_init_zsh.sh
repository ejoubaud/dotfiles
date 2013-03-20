#/bin/sh

# Switch to zsh
if [[ "$SHELL" != *zsh ]]; then
  chsh -s /bin/zsh
  /bin/zsh
fi

