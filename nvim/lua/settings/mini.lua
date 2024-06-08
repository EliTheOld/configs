require("mini.pairs").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()
require("mini.comment").setup()
require("mini.extra").setup()
require("mini.diff").setup()
require("mini.indentscope").setup()
require("mini.surround").setup()
require("mini.files").setup()
require("mini.fuzzy").setup()
require("mini.fuzzy").setup()
require("mini.ai").setup() -- alternative to treesitter textobjects
require("mini.animate").setup({
	scroll = {
		enable = false,
	},
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

local miniclue = require("mini.clue")
miniclue.setup({
	clues = {
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
	triggers = {
		{ mode = "n", keys = "<Leader>" }, -- Leader triggers
		{ mode = "x", keys = "<Leader>" },
		{ mode = "n", keys = "[" }, -- mini.bracketed
		{ mode = "n", keys = "]" },
		{ mode = "x", keys = "[" },
		{ mode = "x", keys = "]" },
		{ mode = "i", keys = "<C-x>" }, -- Built-in completion
		{ mode = "n", keys = "g" }, -- `g` key
		{ mode = "x", keys = "g" },
		{ mode = "n", keys = "'" }, -- Marks
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },
		{ mode = "n", keys = '"' }, -- Registers
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },
		{ mode = "n", keys = "<C-w>" }, -- Window commands
		{ mode = "n", keys = "z" }, -- `z` key
		{ mode = "x", keys = "z" },
	},
	window = {
		delay = 200,
		config = {
			width = "auto",
			border = "rounded",
		},
	},
})
