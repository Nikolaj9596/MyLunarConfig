vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss", "somesass_ls" })

require("lvim.lsp.manager").setup("tailwindcss")
require("lvim.lsp.manager").setup("somesass_ls")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "css", "scss" } },
}


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "stylelint", filetypes = { "css", "scss" } },
}
