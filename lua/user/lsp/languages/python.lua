-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- { command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{ command = "autopep8", filetypes = { "python" } },
})

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	-- { command = "mypy", filetypes = { "python" } },
	{ command = "codespell", filetypes = { "python" } },
	{ command = "cspell", filetypes = { "python" } },
})

-- Setup dap for python
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
	-- require("dap-python").setup("~/Job/communal-doors-api/.venv/bin/python")
end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function()
	require("dap-python").test_runner = "pytest"
end)

-- require('dap.ext.vscode').json_decode = require'json5'.parse
-- load_launchjs({path}, {type_to_filetypes})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "python" },
	callback = function()
		lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
		lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
		lvim.builtin.which_key.vmappings["d"] = {
			name = "Debug",
			s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
		}
	end,
})
