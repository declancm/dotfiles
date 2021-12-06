# .dotfiles
My customized configuration files for nvim, zsh etc. in Ubuntu (for both WSL2 and non-WSL2).

## Installation (for Debian / Ubuntu):

**Install stow:** \
sudo apt install stow

**Install the .dotfiles:** \
git clone https://github.com/declancm/.dotfiles ~/.dotfiles \
cd ~/.dotfiles \
./install.sh

**Install tmux plugin manager:** \
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

**Install nvim plugin manager:** \
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \\ \
&nbsp;&nbsp;&nbsp;&nbsp;https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
