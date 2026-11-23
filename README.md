# nvim-config

A lightweight, modular Neovim configuration in Lua, built for **C/C++** development.

**Includes:** lazy.nvim · clangd (via Mason) · nvim-cmp + LuaSnip · Treesitter · Telescope · nvim-tree · lualine · conform (format on save) · gitsigns · autopairs · which-key · sakura colorscheme with transparent background.

## Requirements

- **Neovim ≥ 0.12**
- `git`, a C compiler (`gcc`/`clang`), `ripgrep`, `fd`
- `tree-sitter` CLI (used to build parsers)
- `clang-format` and `stylua` (optional, for format on save)
- A [Nerd Font](https://www.nerdfonts.com/) set in your terminal

**macOS**

```bash
brew install neovim git ripgrep fd tree-sitter clang-format stylua
```

**Debian / Ubuntu**

```bash
sudo apt install git ripgrep fd-find build-essential clang-format xclip
```

## Installation

```bash
# 1. Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# 2. Clone
git clone https://github.com/litissia28/nvim-config.git ~/.config/nvim

# 3. Launch
nvim
```

On first launch, lazy.nvim installs all plugins, Mason installs `clangd`, and Treesitter compiles its parsers. Restart Neovim once it's done. Run `:checkhealth` if something looks off.

## Usage

Leader key: `Space`. Press it and wait to see every shortcut via which-key.

| Keys | Action |
| --- | --- |
| `<leader>e` | Toggle file explorer |
| `<leader>ff` / `fg` / `fb` / `fr` | Find files / grep / buffers / recent files |
| `gd` / `gD` / `gr` / `K` | Definition / declaration / references / hover |
| `<leader>rn` / `<leader>ca` | Rename symbol / code action |
| `<leader>d`, `[d` / `]d` | Show diagnostic / previous / next |
| `<leader>f` | Format buffer |
| `]c` / `[c`, `<leader>hp` / `hr` | Next / previous Git hunk, preview / reset |
| `<leader>w` / `<leader>q` | Save / quit |
| `<C-h/j/k/l>` | Move between splits |

## Structure

```text
init.lua                 # Entry point
lua/config/
├── options.lua          # Editor options
├── keymaps.lua          # Global keymaps
├── lazy.lua             # lazy.nvim bootstrap
└── plugins/             # One file per plugin group
```

> **Transparency:** the background is cleared so your terminal handles opacity and blur (e.g. `background_opacity 0.88` in Kitty).
