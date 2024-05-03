# 🧼 The CLEAN Neovim Config 🧼

This is my neovim nightly lua config which is full of some heat 🔥 custom
functions, keymaps, and plugins configurations.

## Requirements

- Neovim (nightly 🌘)
- fd
- fzf
- npm
- python3-venv
- ripgrep
- stow
- xsel (for non WSL)
- win32yank (for WSL)

## Installation

```bash
git clone https://github.com/declancm/nvim-clean.git
cd nvim-clean && stow .
```

## VSCodeVim Config

### settings.json

```jsonc
[
    // ...
    "editor.cursorBlinking": "solid",
    "editor.minimap.enabled": false,
    "editor.lineNumbers": "relative",
    "vim.leader": "<space>",
    "vim.highlightedyank.enable": true,
    "vim.normalModeKeyBindingsNonRecursive": [
        {
            "before": ["<leader>", "f", "f"],
            "commands": ["workbench.action.quickOpen"]
        },
        {
            "before": ["<leader>", "f", "t"],
            "commands": ["workbench.action.experimental.quickTextSearch"]
        },
        {
            "before": ["<leader>", "f", "c"],
            "commands": ["workbench.action.showCommands"]
        },
        {
            "before": ["<leader>", "r", "n"],
            "commands": ["editor.action.rename"]
        },
        {
            "before": ["[", "d"],
            "commands": ["editor.action.marker.prev"]
        },
        {
            "before": ["]", "d"],
            "commands": ["editor.action.marker.next"]
        },
        {
            "before": ["H"],
            "commands": ["editor.action.showHover"]
        },
        {
            "before": ["<leader>", "z"],
            "commands": ["workbench.action.toggleMaximizeEditorGroup"]
        },
        {
            "before": ["<c-u>"],
            "after": ["<c-u>", "z", "z"]
        },
        {
            "before": ["<c-d>"],
            "after": ["<c-d>", "z", "z"]
        },
        {
            "before": ["J"],
            "after": ["m", "`", "J", "`", "`"]
        },
        {
            "before": ["Y"],
            "after": ["y", "$"]
        }
    ]
]
```

