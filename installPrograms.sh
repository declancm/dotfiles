#!/bin/bash

#Exit immediately if a command exits with a non-zero status.
set -e

apt_update()
{
    sudo apt update
    sudo apt upgrade -y
}

#stow
sudo apt install stow

#nvim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

#lsp
sudo apt install clangd

#tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#zsh
apt_update
sudo apt install zsh
chsh -s $(which zsh)
sudo apt install zoxide
sudo apt-get install x11-xserver-utils
sudo apt-get install x11-xkb-utils
exec zsh

#treesitter
apt_update
sudo apt-get install ripgrep
sudo apt install fd-find
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install -g neovim
sudo npm install tree-sitter
sudo npm install -g tree-sitter-cli
# :TSInstall query
