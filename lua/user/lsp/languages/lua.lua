local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
})

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "luacheck", filetypes = { "lua" } },
	{ command = "codespell", filetypes = { "lua" } },
	{ command = "cspell", filetypes = { "lua" } },
})
