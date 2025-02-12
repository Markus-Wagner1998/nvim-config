vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<cr><C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>s', ':split<cr><C-w>j', {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew<cr>', {noremap = true})

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true})

vim.wo.number = true
vim.wo.relativenumber = true
