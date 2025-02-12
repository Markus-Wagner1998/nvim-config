return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('n', '<Leader>cp', ':Copilot panel<CR>')
  end
}
