vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jsonls" })

require("lvim.lsp.manager").setup("jsonls")
-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "fixjson", filetypes = { "json" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "jsonlint", filetypes = { "json"} },
}

