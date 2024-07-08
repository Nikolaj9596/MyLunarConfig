vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
}

vim.filetype.add {
  extension = {
    zsh = "zsh",
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "cspell",     filetypes = { "sh", "zsh" } },
  { command = "shellcheck", filetypes = { "sh", "zsh" } },
}

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("bashls", {
  filetypes = { "sh", "zsh" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
