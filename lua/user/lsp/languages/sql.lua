local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "sqlfluff", filetypes = { "sql" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "sqlfluff", filetypes = { "sql" } },
}

