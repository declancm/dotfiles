stow --dotfiles --adopt alacritty/
stow --dotfiles --adopt bash/
stow --dotfiles --adopt fonts/
stow --dotfiles --adopt nvim/
stow --dotfiles --adopt tmux/

curl -LOs --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
