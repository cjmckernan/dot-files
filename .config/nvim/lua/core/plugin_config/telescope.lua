require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>p', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>:vsplit<CR>', { noremap = true, silent = true })

