local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "markdownlint", filetypes = { "markdown" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "markdownlint", filetypes = { "markdown" } },
}

