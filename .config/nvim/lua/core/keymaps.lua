vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Map leader w + q + x(Save and exit) 
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':wq<CR>', { noremap = true, silent = true })


-- Next and previou buffers 
vim.api.nvim_set_keymap('n', 'H', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', ':bnext<CR>', { noremap = true, silent = true })
-- Use <leader>n to open a new empty buffer in a vertical split
vim.api.nvim_set_keymap('n', '<leader>s', ':vsplit <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':split <CR>', { noremap = true, silent = true })

