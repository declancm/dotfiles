# .dotfiles

My customized configuration files for nvim, zsh etc. in Ubuntu (for both WSL2\
and non-WSL2 Ubuntu).

## Installation (for Debian / Ubuntu)

### Manual Installation

**Install stow:**

```bash
sudo apt install stow
```

**Install the .dotfiles:**

```bash
git clone <https://github.com/declancm/.dotfiles> ~/.dotfiles \
cd ~/.dotfiles && ./install.sh
```

**Install tmux plugin manager:**

```bash
git clone <https://github.com/tmux-plugins/tpm> ~/.tmux/plugins/tpm
```

**Within Neovim:**

```vim
:PackerInstall
:PackerCompile
:TSInstall
```

### Quick Installation

_Note: This method includes required programs._

```bash
git clone https://github.com/declancm/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
source installPrograms.sh
```
