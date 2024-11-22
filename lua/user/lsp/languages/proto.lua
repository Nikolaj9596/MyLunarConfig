vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bufls", })


require("lvim.lsp.manager").setup("bufls")

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "buf", filetypes = { "proto" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "buf", filetypes = { "proto",} },
}

