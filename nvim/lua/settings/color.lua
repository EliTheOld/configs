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
require("tokyonight").setup({
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = false, -- Enable this to disable setting the background color
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
})
vim.cmd("colorscheme tokyonight")
