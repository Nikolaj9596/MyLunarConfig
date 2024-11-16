vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet-ls" })
require("lvim.lsp.manager").setup("emmet-ls")

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "sql-formatter", filetypes = { "sql" } },
-- }

local linters = require "lvim.lsp.null-ls.linsqlters"
linters.setup {
  { command = "cspell",   filetypes = { "html" } },
}
