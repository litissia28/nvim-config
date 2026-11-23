# Neovim Configuration

A modular, lightweight, and modern Neovim configuration written in Lua, tailored for **C and C++** development with a dark rose/sakura aesthetic.

## Features

- **Plugin Manager:** `lazy.nvim` with automatic bootstrapping and lazy-loading
- **Colorscheme:** `sakura.nvim` with custom terminal transparency support
- **Modular Structure:** Clean separation between core settings, keymaps, and plugins
- **C/C++ Ready:** Configured for `clangd`, `CMake`, and `Make` workflows

## Directory Structure

```text
~/.config/nvim/
├── init.lua                  # Entry point
├── .gitignore
├── README.md
└── lua/
    └── config/
        ├── options.lua       # Editor settings (indentation, line numbers, search, clipboard)
        ├── keymaps.lua       # Custom keybindings and Leader shortcuts
        ├── lazy.lua          # lazy.nvim bootstrap and plugin loader
        └── plugins/
            └── colorscheme.lua
```

## Prerequisites

Make sure the following tools are installed on your system before launching Neovim:

- **Neovim** (`>= 0.10.0`)
- **Git** (required for `lazy.nvim` to clone plugins)
- **A C/C++ compiler** (`gcc` or `clang`) — required for Treesitter parser compilation
- **Ripgrep** (`rg`) and **fd** — required for Telescope live grep and file search
- **A Nerd Font** (e.g., *JetBrainsMono Nerd Font*, *FiraCode Nerd Font*) configured in your terminal for file icons

### Quick Dependency Install (Ubuntu / Linux Mint / Debian)

```bash
sudo apt update
sudo apt install -y git ripgrep fd-find build-essential xclip
```

> **Note:** `xclip` (or `wl-clipboard` on Wayland) is needed so Neovim's `unnamedplus` clipboard integrates seamlessly with your system clipboard (`Ctrl+C` / `Ctrl+V`).

## Installation

1. **Back up your existing Neovim configuration** (if any):

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. **Clone this repository:**

```bash
git clone [https://github.com/](https://github.com/)<your-username>/<your-repo>.git ~/.config/nvim
```

3. **Launch Neovim:**

```bash
nvim
```

On first launch, `lazy.nvim` will automatically bootstrap itself, install all configured plugins, and apply the colorscheme.

## Terminal Transparency Setup

This configuration clears Neovim's background highlight groups (`bg = "none"`) so your terminal emulator controls the dark translucent tint and blur effect.

Configure your terminal opacity around **85%–90%** (`0.88`):

- **Kitty** (`~/.config/kitty/kitty.conf`):
  ```conf
  background_opacity 0.88
  background_blur 20
  ```

- **Alacritty** (`~/.config/alacritty/alacritty.toml`):
  ```toml
  [window]
  opacity = 0.88
  blur = true
  ```

- **WezTerm** (`~/.wezterm.lua`):
  ```lua
  config.window_background_opacity = 0.88
  ```

- **GNOME Terminal / Linux Mint Terminal:**
  Open **Preferences** -> **Colors** -> check **Use transparent background** and set transparency to **10%–15%**.

## Keybindings Overview

- **Leader key:** `Space`
- `jk` (Insert mode): Exit to Normal mode
- `<leader>w` / `<leader>q`: Save / Quit window
- `<C-h/j/k/l>` or `<C-Arrows>`: Navigate between splits
- `J` / `K` (Visual mode): Move selected block down / up with auto-indentation
- `<C-d>` / `<C-u>`: Scroll half-page and center cursor
