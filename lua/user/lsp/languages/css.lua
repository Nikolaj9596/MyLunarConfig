vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cssls", "some-sass-language-server"})

require("lvim.lsp.manager").setup("cssls")
require("lvim.lsp.manager").setup("some-sass-language-server")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "css", "scss" } },
}
