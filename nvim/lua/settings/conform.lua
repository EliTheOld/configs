require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = {{ "black", "mypy" }},
    c = { "clang-format" },
    go = { "gofumpt", "goimports" },
  },
})
