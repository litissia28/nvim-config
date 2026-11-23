return {
    -- Statusline & Top Tabline (Powerline angled style)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- Custom component to display the active LSP server (e.g., clangd)
            local lsp_status = {
                function()
                    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                    if #buf_clients == 0 then
                        return "No LSP"
                    end
                    local names = {}
                    for _, client in ipairs(buf_clients) do
                        table.insert(names, client.name)
                    end
                    return " " .. table.concat(names, ", ")
                end,
            }

            -- Display current working directory folder name (like ~/progcmp/cf/1968)
            local project_dir = {
                function()
                    return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
                end,
            }

            require("lualine").setup({
                options = {
                    theme = "auto",
                    globalstatus = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" }, -- Sharp angled separators
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            padding = { left = 1, right = 2 },
                        },
                    },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { project_dir },
                    lualine_x = { "progress", "location" },
                    lualine_y = { lsp_status },
                    lualine_z = { "filetype" },
                },
                -- Top bar showing open buffers (matching the top bar in your screenshot)
                tabline = {
                    lualine_a = {
                        { "filename", path = 1 },
                    },
                    lualine_z = {
                        {
                            "buffers",
                            show_filename_only = true,
                            mode = 0,
                            symbols = { alternate_file = "" },
                        },
                    },
                },
            })
        end,
    },
    -- 2. Fuzzy Finder (Telescope)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search text in project" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List open buffers" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    -- Ignore build artifacts and git metadata when searching
                    file_ignore_patterns = {
                        "%.git/",
                        "build/",
                        "cmake%-build%-.*",
                        "%.o$",
                        "%.out$",
                    },
                    layout_config = {
                        horizontal = {
                            preview_width = 0.55,
                        },
                    },
                },
            })
        end,
    },
    -- 3. File Explorer (nvim-tree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 32,
                    side = "left",
                },
                renderer = {
                    group_empty = true,
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        show = {
                            git = true,
                            folder = true,
                            file = true,
                            folder_arrow = true,
                        },
                    },
                },
                filters = {
                    dotfiles = false, -- Show hidden files like .gitignore or .clang-format
                    custom = { "^\\.git$" },
                },
                git = {
                    enable = true,
                    ignore = false,
                },
            })

            -- Keep background transparent to match sakura.nvim
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
        end,
    },
}
