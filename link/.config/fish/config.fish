# Remove default welcome message
set fish_greeting

# Source all files in ~/.dotfiles/source/
function src
  if test "x$argv[1]" = x
    for file in ~/.dotfiles/source/*
      source "$file"
    end
  else
    source "$HOME/.dotfiles/source/$argv[1].sh"
  end
end

function dotfiles
  ~/.dotfiles/bin/dotfiles $argv && src
end

src
