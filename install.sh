stow alacritty
stow bash
if [ ! -f $HOME/.local/share/fonts/'Hack Regular Nerd Font Complete.ttf' ]
then
    stow fonts
fi
stow nvim
stow tmux
