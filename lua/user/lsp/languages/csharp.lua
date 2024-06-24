vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "omnisharp", "csharp_ls"})

require("lvim.lsp.manager").setup("csharp_ls")
require("lvim.lsp.manager").setup("omnisharp")


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "csharpier", filetypes = { "c_sharp" } },
}
