-- require "user.lsp.languages.rust"
require("user.lsp.languages.go")
require("user.lsp.languages.js-ts")
require("user.lsp.languages.sh")
require("user.lsp.languages.emmet")
require("user.lsp.languages.css")
require("user.lsp.languages.md")
require("user.lsp.languages.cs")
require("user.lsp.languages.sql")
require("user.lsp.languages.python")
require("user.lsp.languages.lua")

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "shfmt", filetypes = { "sh", "zsh" } },
})

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { command = "eslint_d", filetypes = { "javascript" } },
	{
		command = "codespell",
		filetypes = {
			"javascript",
			"typescript",
			"tsx",
			"python",
			"cs",
			"scss",
			"html",
			"yaml",
			"sh",
			"zsh",
			"markdown",
			"sql",
		},
	},
})
