require("gruvbox").setup({
    contrast = "hard", -- can be "hard", "soft" or empty string
    transparent_mode = true,
})
require("rose-pine").setup({
    variant = "main", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },
    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
})
-- vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme rose-pine")
