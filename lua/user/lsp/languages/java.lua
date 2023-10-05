vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
}

-- Set a linter.
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "yamllint", filetypes = { "yaml", "yml" } },
-- }

