# .dotfiles

## Requirements

- Alacritty
- fzf
- lazygit
- neovim (nightly)
  - fd
  - npm
  - python3-venv
  - xsel (for non-WSL)
  - win32yank (for WSL)
- ripgrep
- tmux
- zoxide

## Installation

```bash
sudo apt-get install stow -y
git clone <https://github.com/declancm/.dotfiles> ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```
