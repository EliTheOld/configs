local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	-- NOTE: LSP plugins
	"neovim/nvim-lspconfig",
	-- Cmp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"stevearc/conform.nvim",
	"nvim-lua/plenary.nvim",

	{
		"m-demare/hlargs.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"folke/neodev.nvim",
		},
	},

	-- NOTE: COLOR schemes
	"catppuccin/nvim",

	-- NOTE: UI plugins
	"sanfusu/neovim-undotree",
	"nvim-telescope/telescope-project.nvim",
	"lewis6991/gitsigns.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- WARN: mini plugins
	{ "echasnovski/mini.nvim", version = false },
	-- {
	-- 	"echasnovski/mini.statusline",
	-- 	event = "VeryLazy",
	-- 	opts = function()
	-- 		return {
	-- 			content = {
	-- 				active = function()
	-- 					local m = require("mini.statusline")
	-- 					local mode, mode_hl = m.section_mode({ trunc_width = 120 })
	-- 					local spell = vim.wo.spell and (m.is_truncated(120) and "S" or "SPELL") or ""
	-- 					local git = m.section_git({ trunc_width = 75 })
	-- 					local diagnostics = m.section_diagnostics({ trunc_width = 75 })
	-- 					local searchcount = m.section_searchcount({ trunc_width = 75 })
	-- 					local filename = m.section_filename({ trunc_width = 60 })
	-- 					local location = m.section_location({ trunc_width = 75 })
	-- 					return m.combine_groups({
	-- 						{ hl = mode_hl, strings = (m.is_truncated(250) and { mode }) },
	-- 						"%<", -- Mark general truncate point
	-- 						{ hl = "Function", strings = { diagnostics, git } },
	-- 						"%=", -- End left alignment
	-- 						{ hl = "Function", strings = { searchcount } },
	-- 						{ hl = "Function", strings = { filename } },
	-- 						{ hl = mode_hl, strings = { spell, location } },
	-- 					})
	-- 				end,
	-- 			},
	-- 		}
	-- 	end,
	-- 	config = function(_, opts)
	-- 		require("mini.statusline").setup(opts)
	-- 		vim.opt.laststatus = 3
	-- 	end,
	-- },
})
