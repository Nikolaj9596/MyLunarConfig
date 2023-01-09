-- Additional Plugins
lvim.plugins = {
  "ellisonleao/gruvbox.nvim",
  "lunarvim/darkplus.nvim",
  "lunarvim/github.nvim",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "NvChad/nvim-colorizer.lua",
  "karb94/neoscroll.nvim",
  "leoluz/nvim-dap-go",
  "mfussenegger/nvim-dap-python",
  "mxsdev/nvim-dap-vscode-js",
  "christianchiarulli/nvim-ts-autotag",
  "christianchiarulli/nvim-ts-rainbow",
  "jose-elias-alvarez/typescript.nvim",
  "MattesGroeger/vim-bookmarks",
  "renerocksai/calendar-vim",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  "MunifTanjim/nui.nvim",
  "kylechui/nvim-surround",
  "ghillb/cybu.nvim",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "opalmay/vim-smoothie",
  "windwp/nvim-spectre",
  "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  "lvimuser/lsp-inlayhints.nvim",
  "folke/zen-mode.nvim",
  "lunarvim/templeos.nvim",
  "petertriho/nvim-scrollbar",
  "hrsh7th/cmp-emoji",
  "nacro90/numb.nvim",
  "sindrets/diffview.nvim",
  "renerocksai/telekasten.nvim",
  "mattn/vim-gist",
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  },
  -- "j-hui/fidget.nvim",
  -- "christianchiarulli/harpoon",
  -- "mattn/webapi-vim",
  -- "is0n/jaq-nvim",
  -- "TimUntersberger/neogit",
  -- "kevinhwang91/nvim-bqf",
  -- "ggandor/leap.nvim",
  -- "simrat39/rust-tools.nvim",

  -- "olexsmir/gopher.nvim",
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup {
  --       -- optional configuration
  --     }
  --   end,
  -- },
  -- {
  --   "jinh0/eyeliner.nvim",
  --   config = function()
  --     require("eyeliner").setup {
  --       highlight_on_key = true,
  --     }
  --   end,
  -- },
  -- { "tzachar/cmp-tabnine", run = "./install.sh" },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
  --       }
  --     end, 100)
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup {
  --       formatters = {
  --         insert_text = require("copilot_cmp.format").remove_existing,
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  -- },

  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
}
