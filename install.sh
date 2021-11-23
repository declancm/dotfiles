stow bash
stow nvim
stow tmux

#echo "#include \"keybindings/keybindings.json\" " >> $HOME/.config/Code/User/keybindings.json
if [ -f $HOME/.config/Code/User/keybindings.json ] && [ ! -L $HOME/.config/Code/User/keybindings.json ]
then
    mkdir $HOME/.config/Code/User/backupKeybindings
    mv -f $HOME/.config/Code/User/keybindings.json $HOME/.config/Code/User/backupKeybindings/keybindings.json
fi

if [ ! -L $HOME/.config/Code/User/keybindings.json ]
then
    stow vscode
fi

stow x
stow zsh
