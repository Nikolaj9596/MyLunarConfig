vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "marksman-ls" })

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "markdownlint", filetypes = { "markdown", "md" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "markdownlint", filetypes = { "markdown", "md" } },
}

