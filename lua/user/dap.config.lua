local dap = require "dap"

-- Get the current working directory
local current_directory = vim.fn.getcwd()

-- Set up Python debugging using debugpy from the virtual environment
dap.adapters.python = {
  type = "executable",
  command = current_directory .. "/.venv/bin/python3.11",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Python: Attach",
    django = true,
    connect = {
      host = "localhost",
      port = 5678,
    },
    pathMappings = {
      {
        localRoot = current_directory,
        remoteRoot = "/app",
      },
    },
    justMyCode = false,
  },
}
