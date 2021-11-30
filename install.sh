stow alacritty
stow bash
if [ ! -f $HOME/.local/share/fonts/'Hack Regular Nerd Font Complete.ttf' ]
then
    stow fonts
fi
stow nvim
stow tmux

#echo "#include \"keybindings/keybindings.json\" " >> $HOME/.config/Code/User/keybindings.json
if [ ! -f $HOME/.config/Code/User/settings.json ]
then
    echo "vscode is not installed."
else
    if [ -f $HOME/.config/Code/User/keybindings.json ] && [ ! -L $HOME/.config/Code/User/keybindings.json ]
    then
        mkdir $HOME/.config/Code/User/backup
        mv -f $HOME/.config/Code/User/keybindings.json $HOME/.config/Code/User/backup/keybindings.json
        echo "A keybindings.json file already exists and was moved to: $HOME/.config/Code/User/backup/keybindings.json"
    fi

    if [ ! -L $HOME/.config/Code/User/keybindings.json ]
    then
        stow vscode
    else
        echo "A keybindings.json symlink already exists."
    fi
fi

stow x
stow zsh
git clone https://github.com/tmux-plugins/tmp ~/.tmux/plugins/tpm
