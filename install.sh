#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
#[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Package managers & packages
. "$DOTFILES_DIR/scripts/brew.sh"

# sync dot file to home directory
function deploy() {
    rsync -r .zshrc \
        .vim \
        .vimrc \
        .aliases \
        .tmux.conf \
        .tmux \
        .gitconfig \
        ~/;
}
sudo -v
deploy;
