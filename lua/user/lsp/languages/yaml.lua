vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })
require("lvim.lsp.manager").setup "yamlls"

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "yamlfmt", filetypes = { "yaml", "yml" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "yamllint", filetypes = { "yaml", "yml" } },
}
