local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself
	-- root plugins
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- Vim surround
	use("tpope/vim-surround")

	-- Buffers line
	use("akinsho/bufferline.nvim")

	-- Lualine line
	use("nvim-lualine/lualine.nvim")

	-- Close buffers
	use("famiu/bufdelete.nvim")
	-- use "moll/vim-bbye"

	-- Nvim-tree
	use("kyazdani42/nvim-web-devicons") -- nvim-tree icon for file explorer
	use("kyazdani42/nvim-tree.lua") -- nvim-tree a file explorer

	-- Colorschemes
	use("ellisonleao/gruvbox.nvim") -- gruvbox colorscheme
	use("sainnhe/gruvbox-material") -- gruvbox-material colorscheme
	use("lunarvim/darkplus.nvim") -- lunarvim darkplus colorscheme
	use("tanvirtin/monokai.nvim") -- monokai colorscheme

	-- Cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lua") -- lua completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("andersevenrud/cmp-tmux") -- tmux completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("honza/vim-snippets") -- contains Codeigniter snippets

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("camgraff/telescope-tmux.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("tpope/vim-fugitive")
	use("rhysd/committia.vim")

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")

	-- Impatient lua speed module
	use("lewis6991/impatient.nvim")

	-- Indentation guide
	use("lukas-reineke/indent-blankline.nvim")

	-- Flutter tools
	use("akinsho/flutter-tools.nvim")
	use("AgrimV/hot-reload.vim")

	-- Terminal show
	use("akinsho/toggleterm.nvim")

	-- Keymappings
	use("folke/which-key.nvim")

	-- tmux navigator
	use("alexghergh/nvim-tmux-navigation")

	-- Smooth scrolling
	use("karb94/neoscroll.nvim")

	-- Numb peeks line
	use("nacro90/numb.nvim")

	-- Stabilizer buffer content on open/close
	use("luukvbaal/stabilize.nvim")

	-- Harpooning for better navigation
	use("ThePrimeagen/harpoon")

	-- Better wordmotion move
	use("chaoren/vim-wordmotion")

	-- Emmet
	use("mattn/emmet-vim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
