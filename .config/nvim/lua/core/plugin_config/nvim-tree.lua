vim.g.loaded_netrw = 1
vim.g.loadednetrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
