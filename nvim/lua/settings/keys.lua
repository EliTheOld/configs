local opts = { noremap = true, silent = true }
-- Shorten function name
local k = vim.api.nvim_set_keymap
--Remap space as leader key
k("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
-- NOTE: CODEIUM keybindings
vim.keymap.set("i", "<C-y>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-n>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-p>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
-- Normal --
-- Better window navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
k("n", "<S-l>", ":bnext<CR>", opts)
k("n", "<S-h>", ":bprevious<CR>", opts)
k("n", "<C-b>d", ":bdelete<CR>", opts)

-- Focus text in the middle of the screen after jumping down or up
k("n", "<C-d>", "<C-d>zz", opts)
k("n", "<C-u>", "<C-u>zz", opts)

-- Insert --
-- Press qq  fast to enter
k("i", "qq", "<ESC>", opts)
k("v", "qq", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Move text up and down
k("v", "<A-j>", ":m .+1<CR>==", opts)
k("v", "<A-k>", ":m .-2<CR>==", opts)
k("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
k("x", "J", ":move '>+1<CR>gv-gv", opts)
k("x", "K", ":move '<-2<CR>gv-gv", opts)
k("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
k("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)



-- WARN: ALL keybindings from whichkey
k("n", "<leader>b", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>", {desc="Buffers"})
k("n", "<leader>e", ":lua MiniFiles.open()<CR>", {desc="Files"})
k("n", "<leader>E", ":Neotree<CR>", {desc="Files"})
k("n", "<leader>w", ":w!<CR>", {desc="Save"})
k("n", "<leader>q", ":q!<CR>", {desc="Quit"})
k("n", "<leader>Q", ":bdelete<CR>", {desc="Delete Buffer"})
k("n", "<leader>u", ":UndotreeToggle<CR>", {desc="Undo Tree"})
k("n", "<leader>H", ":nohlsearch<CR>", {desc="Turn off highlight search"})
k("n", "<leader>F", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", {desc="Find Files"})
k("n", "<leader>m", ":Mason<CR>", {desc="Mason"})
k("n", "<leader>v", ":vnew<CR>", {desc="Open vertical split"})
k("n", "<leader>h", ":new<CR>", {desc="Open horizontal split"})
k("n", "<leader>f", ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown{previewer=true})<CR>", {desc="Find"})
k("n", "<leader>P", ":lua require('telescope').extensions.project.project{}<CR>", {desc="Projects"})
k("n", "<leader>t", ":Telescope<CR>", {desc="Telescope"})
k("n", "<leader>p", ":Lazy<CR>", {desc="Lazy"})

-- NOTE: GIT keybindings
k("n", "<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>", {desc="Next hunk"})
k("n", "<leader>gk", ":lua require 'gitsigns'.prev_hunk()<CR>", {desc="Previous hunk"})
k("n", "<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>", {desc="Blame Line"})
k("n", "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<CR>",  {desc="Preview hunk"})
k("n", "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<CR>", {desc="Reset hunk"})
k("n", "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>", {desc="Reset Buffer"})
k("n", "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<CR>", {desc="Stage Hunk"})
k("n", "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<CR>", {desc="Undo staging hunk"})
k("n", "<leader>go", ":Telescope git_status<CR>", {desc="Git status"})
k("n", "<leader>gb", ":Telescope git_branches<CR>", {desc="Git Branches"})
k("n", "<leader>gc", ":Telescope git_commits<CR>", {desc="Git Commits"})
k("n", "<leader>gd", ":Gitsigns diffthis HEAD<CR>", {desc="Git diff head"})

-- NOTE: LSP keybindings
k("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", {desc="Code Action"})
k("n", "<leader>ld", ":Telescope lsp_definitions<CR>", {desc="LSP Definitions"})
k("n", "<leader>lw", ":Telescope diagnostics<CR>", {desc="Telescope Diagnostics"})
k("n", "<leader>lf", ":lua require('conform').format{async=true}<CR>", {desc="Format Buffer"})
k("n", "<leader>li", ":LspInfo<CR>", {desc="LSP Information"})
k("n", "<leader>lI", ":LspInstallInfo<CR>", {desc="LSP Installer Information"})
k("n", "<leader>lj", ":lua vim.lsp.diagnostic.goto_next()<CR>", {desc="Goto Next diagnostics"})
k("n", "<leader>lk", ":lua vim.lsp.diagnostic.goto_prev()<CR>", {desc="Goto Previous diagnostic"})
k("n", "<leader>ll", ":lua vim.lsp.codelens.run()<CR>", {desc="Codelens Actions"})
k("n", "<leader>lq", ":lua vim.lsp.diagnostic.set_loclist()<CR>", {desc="QuickFix"})
k("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", {desc="Rename"})
k("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>", {desc="Document Symbols"})
k("n", "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<CR>", {desc="Workspace Symbols"})

-- NOTE: Search keybindings
k("n", "<leader>sb", ":Telescope git_branches<CR>", {desc="Checkout Branch"})
k("n", "<leader>sc", ":Telescope colorscheme<CR>", {desc="Change Colorscheme"})
k("n", "<leader>sh", ":Telescope help_tags<CR>", {desc="Find Help"})
k("n", "<leader>sM", ":Telescope man_pages<CR>", {desc="Man Pages"})
k("n", "<leader>sr", ":Telescope old_files<CR>", {desc="Open Recent Files"})
k("n", "<leader>sR", ":Telescope registers<CR>", {desc="Registers"})
k("n", "<leader>sk", ":Telescope keymaps<CR>", {desc="Keymaps"})
k("n", "<leader>sC", ":Telescope commands<CR>", {desc="Commands"})

