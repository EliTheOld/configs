require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
})


require("tokyonight").setup({
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = true, -- Enable this to disable setting the background color
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
	lualine = {
		transparent = true, -- lualine center bar transparency
	},
    	diagnostics = {
        	darker = true, -- darker colors for diagnostic
        	undercurl = true,   -- use undercurl instead of underline for diagnostics
        	background = true,    -- use background color for virtual text
    	},
})
-- setup must be called before loading
require("onedark").load()

vim.cmd("colorscheme onedark")
