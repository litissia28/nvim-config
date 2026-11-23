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
}
