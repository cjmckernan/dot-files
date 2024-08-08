local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/plenary.nvim")
	use("neovim/nvim-lspconfig")
	use("kylechui/nvim-surround")
	use("windwp/nvim-autopairs")
	use("jose-elias-alvarez/null-ls.nvim")
	use("NTBBloodbath/doom-one.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("nvim-orgmode/orgmode")
	use("windwp/nvim-ts-autotag")
	use("mfussenegger/nvim-jdtls")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
