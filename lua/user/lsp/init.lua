-- require "user.lsp.languages.rust"
-- require "user.lsp.languages.go"
-- require "user.lsp.languages.docker"
-- require "user.lsp.languages.php"
require "user.lsp.languages.js-ts"
require "user.lsp.languages.python"
require "user.lsp.languages.sh"
require "user.lsp.languages.emmet"
require "user.lsp.languages.css"
require "user.lsp.languages.yaml"
require "user.lsp.languages.md"
require "user.lsp.languages.json"
require "user.lsp.languages.sql"
require "user.lsp.languages.java"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetypes = { "sh", "zsh" } },
  { command = "prettier", filetypes = { "css" } },
}

