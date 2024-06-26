require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				separator = { left = "" },
				right_padding = 2,
			},
		},
		lualine_b = {
			{
				"diagnostics",
				always_visible = true,
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
			},
		},
		lualine_c = {},
		lualine_x = { "filename", "filetype" },
		lualine_y = {
			"branch",
			{
				"diff",
				colored = true, -- Displays a colored diff status if set to true
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
			},
		},
		lualine_z = {
			{
				"location",
				separator = { right = "" },
				left_padding = 2,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
