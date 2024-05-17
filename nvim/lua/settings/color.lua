require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
})

require("onedarkpro").setup({
	styles = {
		types = "NONE",
		methods = "NONE",
		numbers = "NONE",
		strings = "NONE",
		comments = "italic",
		keywords = "bold,italic",
		constants = "NONE",
		functions = "italic",
		operators = "bold",
		variables = "bold",
		parameters = "NONE",
		conditionals = "italic",
		virtual_text = "NONE",
	},
	options = {
		transparency = true,
	},
})

-- Lua
require("onedark").setup({
	style = "darker",
	transparent = true, -- Show/hide background
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "bold",
		strings = "none",
		variables = "italic",
	},

	-- Lualine options --
	lualine = {
		transparent = true, -- lualine center bar transparency
	},
})
-- require("onedark").load()
-- setup must be called before loading
vim.cmd("colorscheme onedark_dark")
