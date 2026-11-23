-- Set Space as the leader key (must be set before defining keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Quick save and quit
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })

-- Seamless split navigation with Ctrl + h/j/k/l
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Seamless split navigation with Ctrl + Arrow keys
keymap("n", "<C-Left>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-Down>", "<C-w>j", { desc = "Move to lower split" })
keymap("n", "<C-Up>", "<C-w>k", { desc = "Move to upper split" })
keymap("n", "<C-Right>", "<C-w>l", { desc = "Move to right split" })

-- Move selected lines up/down in Visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in Visual mode while indenting
keymap("v", "<", "<gv", { desc = "Outdent selection" })
keymap("v", ">", ">gv", { desc = "Indent selection" })

-- Keep cursor centered during half-page jumps
keymap("n", "<C-d>", "<C-d>zz", { desc = "Half-page down (centered)" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Half-page up (centered)" })
