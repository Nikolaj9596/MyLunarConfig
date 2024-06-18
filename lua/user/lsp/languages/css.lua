vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cssls" })
require("lvim.lsp.manager").setup("cssls")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "css", "scss" } },
}
