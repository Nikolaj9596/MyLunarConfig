vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "lua_ls" })
require("lvim.lsp.manager").setup("lua_ls")

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "luacheck", filetypes = { "lua" } },
}
