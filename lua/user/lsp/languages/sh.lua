vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })
require("lvim.lsp.manager").setup("bashls")

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "cspell",     filetypes = { "sh", "zsh" } },
  { command = "shellcheck", filetypes = { "sh", "zsh" } },
}


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
}
