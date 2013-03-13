#!/usr/bin/env bash
set -e

################################################################################
# Basic symlinks, safe to run on any system
################################################################################

################################################################################
# initialize script and dependencies
# get this bootstrap folder
cd "`dirname $0`"/..
dotfiles_path="`pwd`"
bootstrap_path="$dotfiles_path/bootstrap"
source $bootstrap_path/helpers.sh

##
# symlinking helper function
dkosymlink() {
  local dotfile="$dotfiles_path/$1"
  local homefile="$2"
  dkosymlinking $homefile $dotfile && ln -fns $dotfile $HOME/$homefile
}

################################################################################
# Begin
dkostatus "Symlinking dotfiles"
dkosymlink ack/ackrc             .ackrc

dkosymlink tmux/tmux.conf        .tmux.conf

dkosymlink screen/screenrc       .screenrc

dkosymlink bash/bashrc.sh        .bashrc
dkosymlink bash/bash_profile.sh  .bash_profile

dkosymlink zsh                   .zsh
dkosymlink zsh/zshenv.zsh        .zshenv
