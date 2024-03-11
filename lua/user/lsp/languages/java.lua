vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- Set a formatter.

require("lvim.lsp.manager").setup("jdtls")
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
}
