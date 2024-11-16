vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "sqls" })
require("lvim.lsp.manager").setup("sqls")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "sql-formatter", filetypes = { "sql" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "cspell",   filetypes = { "sql" } },
  -- { command = "sqlfluff", filetypes = { "sql" } },
}
