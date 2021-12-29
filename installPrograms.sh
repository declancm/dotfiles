#!/bin/bash

#Exit immediately if a command exits with a non-zero status.
set -e

printf "This script is only for ubuntu/debian, would you like to proceed? (y/n) "
read input
if [ "$input" != "y" ]
then
    break
fi

apt_update()
{
    sudo apt update
    sudo apt upgrade -y
}

#nvim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

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

#fzf
sudo apt install fzf
sudo apt install universal-ctags
sudo apt install silversearcher-ag

#language servers
sudo apt install clangd
sudo npm i -g pyright
sudo npm i -g clangd
sudo npm i -g vim-language-server
sudo npm i -g bash-language-server

#alacritty
printf "Would you like to install alacritty? (y/n) "
read input
if [ "$input" = "y" ]
then
    sudo add-apt-repository ppa:aslatter/ppa
    sudo apt install alacritty
elif [ "$input" != "n" ]
then
    printf "You did not enter a valid input.\n"
fi

#ruby
printf "Would you like to install Ruby on Rails? (y/n) "
read input
if [ "$input" = "y" ]
then
    rudo apt install -y ruby-full
    sudo gem install neovim
    sudo gem install rails
    sudo apt-get install -y sqlite3 libsqlite3-dev
    sudo apt install yarn
    sudo apt install bundler
elif [ "$input" != "n" ]
then
    printf "You did not enter a valid input.\n"
fi

#powershell
printf "Would you like to install PowerShell? (y/n) "
read input
if [ "$input" = "y" ]
then
    # Update the list of packages
    sudo apt-get update
    # Install pre-requisite packages.
    sudo apt-get install -y wget apt-transport-https software-properties-common
    # Download the Microsoft repository GPG keys
    wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
    # Register the Microsoft repository GPG keys
    sudo dpkg -i packages-microsoft-prod.deb
    # Update the list of packages after we added packages.microsoft.com
    sudo apt-get update
    # Install PowerShell
    sudo apt-get install -y powershell
elif [ "$input" != "n" ]
then
    printf "You did not enter a valid input.\n"
fi

#xsel
sudo apt-get install -y xsel
export DISPLAY=:0

#go
apt_update
sudo apt install -y golang

#lazygit
git clone https://github.com/jesseduffield/lazygit.git ~/lazygit
cd ~/lazygit && go install && cd -

#tree
sudo apt install tree

#fnm
sudo apt install curl
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir $HOME/.local/bin

#stow
sudo apt install stow

#dotfiles
. ./install.sh
