  local obs = require("obs")

  obs.setup {
    vault_home = "/Users/navagin/Obsidian/Notes/",
    journal = {
      template_name = "daily",
    },
  }

-- config for nvim-cmp
local cmp_source = require "obs.cmp-source"
vim.cmp.register_source("obs", cmp_source.new())

-- config for obs.nvim
local group = vim.api.nvim_create_augroup("ObsNvim", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = group,
  pattern = "*.md",
  desc = "Setup notes nvim-cmp source",
  callback = function()
    if obs.vault:is_current_buffer_in_vault() then
      require("cmp").setup.buffer {
        sources = {
          { name = "obs" },
          { name = "luasnip" },
        },
      }
    end
  end,
})
