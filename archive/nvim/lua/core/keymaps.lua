local builtin = require("telescope.builtin")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Map leader w + q + x(Save and exit)
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":wq<CR>", { noremap = true, silent = true })

-- Telescope keymaps
vim.keymap.set("n", "<Space>p", builtin.find_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>:vsplit<CR>", { noremap = true, silent = true })

-- Key maps for nvim tree
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Next and previou buffers
vim.api.nvim_set_keymap("n", "H", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", ":bnext<CR>", { noremap = true, silent = true })
-- Use <leader>n to open a new empty buffer in a vertical split
vim.api.nvim_set_keymap("n", "<leader>s", ":vsplit <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":split <CR>", { noremap = true, silent = true })

-- Remap escape terminal to Escape
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- LSP related keybinds
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
