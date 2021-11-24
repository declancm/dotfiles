stow -D alacritty
stow -D bash
if [ -L $HOME/.local/share/fonts/'Hack Regular Nerd Font Complete.ttf' ]
then
    stow -D fonts
fi
stow -D nvim
stow -D tmux
if [ -L $HOME/.config/Code/User/keybindings.json ]
then
    stow -D vscode
    mv -f $HOME/.config/Code/User/backup/keybindings.json $HOME/.config/Code/User/keybindings.json
    rmdir $HOME/.config/Code/User/backup
fi
stow -D x
stow -D zsh
