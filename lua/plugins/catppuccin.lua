return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- `flavour = "auto"` follows `background`, so auto-dark-mode only has to
    -- flip that option instead of hardcoding a colorscheme.
    require("catppuccin").setup({ flavour = "auto" })
    vim.o.background = "dark"
    vim.cmd.colorscheme("catppuccin")
  end,
}