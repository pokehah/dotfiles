#!/bin/bash
# This script links the dotfiles to the assumed appropriate location.

ConfigPath="$(pwd)"

mkdir -p "${HOME}"/.config/nvim
ln -s "${ConfigPath}"/init.vim "${HOME}"/.config/nvim/init.vim

mkdir -p "${HOME}"/.config/tmux
ln -s "${ConfigPath}"/tmux.conf "${HOME}"/.config/tmux/tmux.conf

if [[ ! -f "${HOME}/.bash_aliases" ]]; then
    ln -s "${ConfigPath}"/.bash_aliases "${HOME}"/.bash_aliases
else
    echo "\"${HOME}/.bash_aliases\" already exists, cannot link."
    # echo "Would you like to prepend existing config with this one?"
    # if ( input == "Y" || "y" ) { (cat myConfig; cat curConfig) > .bash_aliases }
fi
