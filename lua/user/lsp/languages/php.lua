vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "phpactor" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "php-cs-fixer", filetypes = { "php" } },
}

vim.filetype.add {
  extension = {
    php = "php",
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "cspell", filetypes = { "php" } },
  { command = "phpcs", filetypes = { "php" } },
  -- { command = "phpmd", filetypes = { "php" } },
  -- { command = "phpstan", filetypes = { "php" } },
}

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("phpactor", {
  filetypes = { "php" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
