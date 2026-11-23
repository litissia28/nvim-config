return {
  "anAcc22/sakura.nvim",
  name = "sakura",
  lazy = false,
  priority = 1000, -- Load first so colors apply before any UI component
  config = function()
    vim.cmd.colorscheme("sakura")

    -- Let the terminal handle background opacity and blur
    local transparent_groups = {
      "Normal",       -- Active window background
      "NormalNC",     -- Inactive window background
      "NormalFloat",  -- Floating windows (Telescope, Mason, LSP hover)
      "FloatBorder",  -- Floating window borders
      "SignColumn",   -- Line number & diagnostic gutter
      "EndOfBuffer",  -- Empty area below end of file
    }

    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
}
