return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    -- catppuccin's `flavour = "auto"` handles the actual colorscheme swap.
    set_dark_mode = function()
      vim.o.background = "dark"
    end,
    set_light_mode = function()
      vim.o.background = "light"
    end,
  },
}