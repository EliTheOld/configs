-- require("mini.tabline").setup({
--	show_icons = true,
--	set_vim_settings = true,
--	tabpage_section = "left",
-- })
require("mini.pairs").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()
require("mini.comment").setup()
require("mini.extra").setup()
require("mini.diff").setup()
require("mini.indentscope").setup()
require("mini.notify").setup({
    window = {
        border = "double",
        winblend = 100,
    },
})
require("mini.surround").setup()
require("mini.files").setup()
require("mini.test").setup()
require("mini.bufremove").setup()
-- require("mini.completion").setup({
-- 	window = {
-- 		info = { height = 25, width = 80, border = "double", style = "minimal", relative = "cursor" },
-- 		signature = { height = 25, width = 80, border = "double", style = "minimal", relative = "cursor" },
-- 	},
-- })
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
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE', 'WARN'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		warn = { pattern = "%f[%w]()WARN()%f[%W]", group = "MiniHipatternsHack" },

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
			border = "double",
		},
	},
})

local header_art = [[
$$\    $$\ $$$$$$\ $$\      $$\ 
$$ |   $$ |\_$$  _|$$$\    $$$ |
$$ |   $$ |  $$ |  $$$$\  $$$$ |
\$$\  $$  |  $$ |  $$\$$\$$ $$ |
 \$$\$$  /   $$ |  $$ \$$$  $$ |
  \$$$  /    $$ |  $$ |\$  /$$ |
   \$  /   $$$$$$\ $$ | \_/ $$ |
    \_/    \______|\__|     \__|
                                
                                
                                

]]

local starter = require("mini.starter")
starter.setup({
	evaluate_single = true,
	items = nil,
	--        {
	-- 	{ action = "Open Projects", name = "Telescope projects", section = "Telescope" },
	-- 	{ action = "tab G", name = "G: Fugitive", section = "Git" },
	-- 	{ action = "Lazy sync", name = "U: Update Plugins", section = "Plugins" },
	-- 	{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
	-- 	{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
	-- },
	content_hooks = {
		function(content)
			local blank_content_line = { { type = "empty", string = "" } }
			local section_coords = starter.content_coords(content, "section")
			-- Insert backwards to not affect coordinates
			for i = #section_coords, 1, -1 do
				table.insert(content, section_coords[i].line + 1, blank_content_line)
			end
			return content
		end,
		starter.gen_hook.adding_bullet("» "),
		starter.gen_hook.aligning("center", "center"),
	},
	header = header_art,
	footer = os.date(),
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
    au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
  augroup END
]])
