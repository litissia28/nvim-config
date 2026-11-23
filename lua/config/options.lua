local opt = vim.opt

-- Line numbers and cursor
opt.number = true          -- Show current line number
opt.relativenumber = true  -- Relative line numbers for vertical motions
opt.cursorline = true      -- Highlight the current line
opt.signcolumn = "yes"     -- Keep sign column open to prevent text shifting
opt.wrap = false           -- Disable line wrapping
opt.scrolloff = 8          -- Keep at least 8 lines visible above/below cursor

-- Indentation (4 spaces, standard for C/C++)
opt.tabstop = 4            -- Number of spaces a tab counts for
opt.shiftwidth = 4         -- Number of spaces used for autoindent
opt.softtabstop = 4        -- Number of spaces inserted when pressing Tab
opt.expandtab = true       -- Convert tabs to spaces
opt.smartindent = true     -- Autoindent new lines intelligently

-- Search
opt.ignorecase = true      -- Case-insensitive search...
opt.smartcase = true       -- ...unless uppercase characters are used
opt.hlsearch = false       -- Clear search highlight after searching
opt.incsearch = true       -- Show search matches incrementally

-- Appearance
opt.termguicolors = true   -- Enable 24-bit RGB colors
opt.background = "dark"    -- Default to dark background

-- System & files
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.mouse = "a"               -- Enable mouse support in all modes
opt.swapfile = false          -- Disable swap files
opt.undofile = true           -- Persist undo history across sessions
opt.updatetime = 250          -- Faster completion and diagnostic updates

-- Split windows
opt.splitright = true      -- Open vertical splits to the right
opt.splitbelow = true      -- Open horizontal splits below
