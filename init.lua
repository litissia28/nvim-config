-- Neovim configuration entry point

-- disable netrw (neovim's native file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load order matters: options and keymaps must be loaded before plugins.
require("config.options")
require("config.keymaps")
require("config.lazy")
