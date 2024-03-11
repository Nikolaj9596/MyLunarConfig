vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jsonls", "pyright" })

local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic", -- off, basic, strict
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- require("lvim.lsp.manager").setup("ruff_lsp")
require("lvim.lsp.manager").setup("pyright", pyright_opts)
-- require("lvim.lsp.manager").setup("sourcery")

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  -- { command = "blue", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  { command = "ruff", filetypes = { "python" } },
  { command = "cspell", filetypes = { "python", "sh", "cs", "javascript", "typescript", "markdown" } },
  {
    command = "codespell",
    filetypes = { "lua" },
  },
}

-- Setup dap for python

local current_directory = vim.fn.getcwd()
pcall(function()
  require("dap-python").setup(current_directory .. "/.venv/bin/python3.11")
  require("dap-python").setup "python"
end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function()
  require("dap-python").test_runner = "pytest"
end)

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
