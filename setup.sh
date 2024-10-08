#!/bin/bash
# This script links the dotfiles to the assumed appropriate location.

ConfigPath="$(pwd)"
if [[ ! -f "$ConfigPath/$(basename "$0")" ]]; then
    echo "Exiting. Run the script from the directory it and all the configs are in."
    exit
fi

mkdir -vp "${HOME}"/.config/mpd
if [[ ! -L "${HOME}/.config/mpd/mpd.conf" ]]; then
    ln -vs "${ConfigPath}"/mpd.conf "${HOME}"/.config/mpd/mpd.conf
else
    echo "\"${HOME}/.config/mpd/mpd.conf\" already exists, cannot link."
fi

mkdir -vp "${HOME}"/.config/ncmpcpp
if [[ ! -L "${HOME}/.config/ncmpcpp/config" ]]; then
    ln -vs "${ConfigPath}"/ncmpcpp.conf "${HOME}"/.config/ncmpcpp/config
else
    echo "\"${HOME}/.config/ncmpcpp/config\" already exists, cannot link."
fi


mkdir -vp "${HOME}"/.config/nvim
if [[ ! -L "${HOME}/.config/nvim/init.vim" ]]; then
    ln -vs "${ConfigPath}"/init.vim "${HOME}"/.config/nvim/init.vim
else
    echo "\"${HOME}/.config/nvim/init.vim\" already exists, cannot link."
fi

mkdir -vp "${HOME}"/.config/tmux
if [[ ! -L "${HOME}/.config/tmux/tmux.conf" ]]; then
    ln -vs "${ConfigPath}"/tmux.conf "${HOME}"/.config/tmux/tmux.conf
else
    echo "\"${HOME}/.config/tmux/tmux.conf\" already exists, cannot link."
fi
#else if [[ -F path ]] then "oh, you have the file. how do you want to solve this?"

if [[ ! -f "${HOME}/.bash_aliases" ]]; then
    ln -vs "${ConfigPath}"/bash_aliases "${HOME}"/.bash_aliases
else
    echo "\"${HOME}/.bash_aliases\" already exists, cannot link."
    # echo "Would you like to prepend existing config with this one?"
    # if ( input == "Y" || "y" ) { (cat myConfig; cat curConfig) > .bash_aliases }
fi

if [[ -f "${HOME}/.zshrc" ]]; then
    if ! grep 'source "${HOME}/Configs/bash_aliases"' "${HOME}"/.zshrc > /dev/null; then
        inp='n'
        echo "Source \"${ConfigPath}/bash_aliases\" in \"${HOME}/.zshrc\"?"
        read -r -n 1 -p "(Y/N) >> " inp; echo
        if [[ "${inp}" == [yY] ]]; then
            echo -e "\nsource \"\${HOME}/Configs/bash_aliases\"" >> "${HOME}"/.zshrc
            tail "${HOME}"/.zshrc
        fi
    fi
fi

if [[ ! -d "${HOME}/.config/kitty" ]]; then
    ln -vs "${ConfigPath}"/kitty "${HOME}"/.config/kitty
else
    echo "\"${HOME}/.config/kitty\" already exists, cannot link."
fi

# The cannot link string could be a var
