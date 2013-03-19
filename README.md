# Dotfiles

These are my dotfiles, essentially for Ruby with VIM.

They're essentially a patchwork of existing frameworks:

* [Ben Alman's dotfiles](https://github.com/cowboy/dotfiles) framework for easy storage and installation of the dotfiles and package manager
* [Robby Russel's oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for zsh awesomeness
* [Janus VIM distribution](https://github.com/carlhuda/janus) for the collection of VIM plugin and mappings
* Some custom tweaks

Most of the informations about installation, customization and features can be found from the original projects.

## How does it work ?

When [dotfiles][dotfiles] is run, it does a few things:

1. Git is installed if necessary, via APT or Homebrew (which is installed if necessary).
2. This repo is cloned into the `~/.dotfiles` directory (or updated if it already exists).
2. Files in `init` are executed (in alphanumeric order).
3. Files in `copy` are copied into `~/`.
4. Files in `link` are linked into `~/`.

Note:

* The `backups` folder only gets created when necessary. Any files in `~/` that would have been overwritten by `copy` or `link` get backed up there.
* Files in `bin` are executable shell scripts ([~/.dotfiles/bin][bin] is added into the path).
* Files in `source` get sourced whenever a new shell is opened (in alphanumeric order)..
* Files in `conf` just sit there. If a config file doesn't _need_ to go in `~/`, put it in there.
* Files in `caches` are cached files, only used by some scripts. This folder will only be created if necessary.

## Installation
### OS X
Notes:

* You need to be an administrator (for `sudo`).
* You need to have installed [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a separate, optional (and _much smaller_) download from XCode.

```sh
bash -c "$(curl -fsSL https://raw.github.com/cowboy/dotfiles/master/bin/dotfiles)"
```

### Ubuntu
Notes:

* You need to be an administrator (for `sudo`).
* If APT hasn't been updated or upgraded recently, it will probably be a few minutes before you see anything.

```sh
sudo apt-get -qq update && sudo apt-get -qq upgrade && sudo apt-get -qq install curl && echo &&
bash -c "$(curl -fsSL https://raw.github.com/cowboy/dotfiles/master/bin/dotfiles)"
```

## The "init" step
These things will be installed, but _only_ if they aren't already.

### OS X
* Homebrew
  * git
  * tree
  * sl
  * lesspipe
  * id3tool
  * nmap
  * git-extras
  * htop-osx
  * apple-gcc42 (via [homebrew-dupes](https://github.com/Homebrew/homebrew-dupes/blob/master/apple-gcc42.rb))

### Ubuntu
* APT
  * build-essential
  * libssl-dev
  * git-core
  * tree
  * sl
  * id3tool
  * nmap
  * telnet
  * htop
