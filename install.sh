#!/bin/bash

curl -LOs --output-dir ./alacritty/dot-config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
curl -LOs --create-dirs --output-dir ./fonts/dot-local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFontMono-Regular.ttf
curl -LOs --create-dirs --output-dir ./fonts/dot-local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/HackNerdFontMono-Bold.ttf
curl -LOs --create-dirs --output-dir ./fonts/dot-local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/HackNerdFontMono-Italic.ttf
curl -LOs --create-dirs --output-dir ./fonts/dot-local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/HackNerdFontMono-BoldItalic.ttf

~/gnu/bin/stow --dotfiles --adopt alacritty/
~/gnu/bin/stow --dotfiles --adopt bash/
~/gnu/bin/stow --dotfiles --adopt fonts/
~/gnu/bin/stow --dotfiles --adopt nvim/
~/gnu/bin/stow --dotfiles --adopt tmux/
