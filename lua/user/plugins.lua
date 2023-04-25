
lvim.plugins = {
  -- LSP --
  "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.

  -- Lang --
  "christianchiarulli/nvim-ts-autotag",
  "jose-elias-alvarez/typescript.nvim",
  -- "olexsmir/gopher.nvim", -- Minimalistic plugin for Go development in Neovim written in Lua.

  -- Useful --
  "tyru/open-browser.vim",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "moll/vim-bbye", -- For close buffer
  "windwp/nvim-spectre",  -- Spectre find the enemy and replace them with dark power.
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.
  -- Leap is a general-purpose motion plugin for Neovim, with the ultimate goal of establishing a 
  -- new standard interface for moving around in the visible area in Vim-like modal editors.
  "ggandor/leap.nvim",
  "nacro90/numb.nvim", -- plugin that peeks lines of the buffer in non-obtrusive way.

  -- CMP --
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",

  -- Scroll --
  "petertriho/nvim-scrollbar",
  "opalmay/vim-smoothie",

  -- GIT --
  "TimUntersberger/neogit",
  "mattn/vim-gist",
  "lunarvim/github.nvim",
  "sindrets/diffview.nvim",
  "ruifm/gitlinker.nvim",

  -- Treesitter --
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- DAP --
  -- "leoluz/nvim-dap-go",
  "mxsdev/nvim-dap-vscode-js",
  "mfussenegger/nvim-dap-python",

  -- Colorschemas
  "ellisonleao/gruvbox.nvim",
  "lunarvim/darkplus.nvim",
  "LunarVim/synthwave84.nvim",
  "NvChad/nvim-colorizer.lua",
  -- "lunarvim/templeos.nvim",

  -- UI --
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  {
    "echasnovski/mini.misc",
    config = true,
    --stylua: ignore
    keys = {
      { "<leader>vz", function() require("mini.misc").zoom() end, desc = "Toggle Zoom" },
    },
  },
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    config = function()
      require("mini.bracketed").setup()
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    opts = {
      color = "#ef9062",
      use_colorpalette = false,
      disable = function(_, bufnr)
        if vim.b.semantic_tokens then
          return true
        end
        local clients = vim.lsp.get_active_clients { bufnr = bufnr }
        for _, c in pairs(clients) do
          local caps = c.server_capabilities
          if c.name ~= "null-ls" and caps.semanticTokensProvider and caps.semanticTokensProvider.full then
            vim.b.semantic_tokens = true
            return vim.b.semantic_tokens
          end
        end
      end,
    },
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      -- background_colour = "#A3CCBE",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require "notify"
    end,
  },
  "folke/todo-comments.nvim",
  "j-hui/fidget.nvim", -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  "renerocksai/telekasten.nvim",
  {
    'lukas-reineke/headlines.nvim',
    after = 'nvim-treesitter',
    config = function()
        require('headlines').setup()
    end,
  }, -- This plugin adds highlights for text filetypes, like markdown, orgmode, and neorg.

  -- Dart & Flutter --
  "dart-lang/dart-vim-plugin",
  "thosakwe/vim-flutter",
  "natebosch/vim-lsc",
  "natebosch/vim-lsc-dart",

  -- LuaSnip --
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Autopairs --
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter

  -- Plantuml --
  "aklt/plantuml-syntax",
  "weirongxu/plantuml-previewer.vim",
  -- Markdown --
  { "AckslD/nvim-FeMaco.lua", ft = { "markdown" }, opts = {} },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  -- Auto Session
  "rmagatti/auto-session",
  "rmagatti/session-lens",

  -- Doc String
  {
    "kkoomen/vim-doge",
    -- run = ':call doge#install()'
  },

  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
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
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },

  -- AI --
  -- { "tzachar/cmp-tabnine", build = "./install.sh" },
  -- "jackMort/ChatGPT.nvim",
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "InsertEnter",
  --   -- stylua: ignore
  --   config = function ()
  --     vim.g.codeium_disable_bindings = 1
  --     vim.keymap.set("i", "<A-m>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
  --     vim.keymap.set("i", "<A-f>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
  --     vim.keymap.set("i", "<A-b>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
  --     vim.keymap.set("i", "<A-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
  --     vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
  --   end,
  -- },

  -- "f-person/git-blame.nvim",
  -- "christianchiarulli/nvim-ts-rainbow",
  -- "mfussenegger/nvim-jdtls",
  -- "karb94/neoscroll.nvim",
  -- "ghillb/cybu.nvim",
  -- "kylechui/nvim-surround",
  -- "is0n/jaq-nvim",
  -- "hrsh7th/cmp-emoji",
  -- "monaqa/dial.nvim",
  -- {
  --   "0x100101/lab.nvim",
  --   build = "cd js && npm ci",
  -- },
  -- "renerocksai/calendar-vim",
  -- "simrat39/rust-tools.nvim",
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
  -- "MunifTanjim/nui.nvim",
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  -- },

  -- https://github.com/jose-elias-alvarez/typescript.nvim
}
