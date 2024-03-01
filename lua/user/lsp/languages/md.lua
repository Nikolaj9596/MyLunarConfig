vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "ltex" })

require("lvim.lsp.manager").setup("ltex")
-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "markdown-toc", filetypes = { "markdown", "md" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "markdownlint", filetypes = { "markdown", "md" } },
}

