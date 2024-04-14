vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>s', ':split<cr>', {noremap = true})

vim.wo.number = true
vim.wo.relativenumber = true
