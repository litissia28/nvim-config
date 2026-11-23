return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})

    -- Install core parsers for C/C++ development
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "cmake",
      "make",
      "lua",
      "vim",
      "vimdoc",
      "bash",
    })

    -- Enable native Neovim 0.12 Treesitter highlighting & indentation
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "cmake", "make", "lua", "vim", "bash" },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
