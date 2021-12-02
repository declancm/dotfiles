# .dotfiles
My customized configuration files for nvim, zsh etc. in Ubuntu (for both WSL2 and non-WSL2).

Setup process (for debian/ubuntu):\
git apt install stow\
./install.sh\
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm\
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
