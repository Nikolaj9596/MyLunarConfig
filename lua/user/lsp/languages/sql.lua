vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "sqlls" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "sql-formatter", filetypes = { "sql" } },
}

vim.filetype.add {
  extension = {
    sql = "sql",
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "cspell", filetypes = { "sql" } },
  { command = "sqlfluff", filetypes = { "sql" } },
  -- { command = "phpmd", filetypes = { "php" } },
  -- { command = "phpstan", filetypes = { "php" } },
}

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("sqlls", {
  filetypes = { "sql" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
