lvim.plugins = {

  -- Obsidian *
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Http Request *
  {
    "jellydn/hurl.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
  },

  -- LSP -- *
  "mfussenegger/nvim-jdtls", -- Java

  "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.pl

  -- Lang -- *
  "christianchiarulli/nvim-ts-autotag", -- Added auto tag to end for ts, js html

  -- Leap *
  {
    "ggandor/flit.nvim",
    enabled = true,
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gS", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- Useful -- *
  "tyru/open-browser.vim",
  "nvim-lua/plenary.nvim",
  "MattesGroeger/vim-bookmarks",
  "moll/vim-bbye", -- For close buffer
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.
  "opalmay/vim-smoothie",
  "mattn/webapi-vim",

  -- GIT -- *
  "TimUntersberger/neogit",
  "ruifm/gitlinker.nvim", --A lua neovim plugin to generate shareable file permalinks (with line ranges) for several git web frontend hosts.
  "sindrets/diffview.nvim", --Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  "lewis6991/gitsigns.nvim", -- Super fast git decorations implemented purely in Lua.

  "NvChad/nvim-colorizer.lua", -- Colorize rgb color

  -- Colorschemas
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  "ellisonleao/gruvbox.nvim",
  "lunarvim/darkplus.nvim",
  "navarasu/onedark.nvim",
  "marko-cerovac/material.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- UI --
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#A3CCBE",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      priority = 100,
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require "notify"
    end,
  }, -- Notification plu-- lazy.nvim

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
  },

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
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
  },

  "folke/todo-comments.nvim", -- Highlights todo comments
  -- -- LuaSnip --
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- -- Autopairs --
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter

  -- -- Plantuml --
  "aklt/plantuml-syntax",
  "weirongxu/plantuml-previewer.vim",

  -- -- Markdown --
  {
    "AckslD/nvim-FeMaco.lua",
    ft = { "markdown" },
    opts = {},
  }, -- Catalyze your Fenced Markdown Code-block editing!
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   ft = { "markdown" },
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  -- },

  "MunifTanjim/nui.nvim", -- UI Component
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  }, -- Move faster with unique f/F indicators for each word on the line

  -- Telescope
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  { "nvim-telescope/telescope-media-files.nvim" },

  -- CMP --
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },

  -- DB connector --
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup {
        disable_legacy_commands = true,
      }
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup {}
    end,
  },

  {
    "rmagatti/goto-preview",
  },

  {
    "ThePrimeagen/harpoon",
  },
  { "stevearc/dressing.nvim" }, -- important for select action
  {
    "christoomey/vim-tmux-navigator",
  },

  -- "mattn/vim-gist",

  -- Treesitter --
  -- "nvim-treesitter/nvim-treesitter",
  --"nvim-treesitter/playground",
  --"nvim-treesitter/nvim-treesitter-textobjects",
  --"nvim-treesitter/nvim-treesitter-refactor",
  --"nvim-treesitter/nvim-tree-docs",

  -- -- Auto Session
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens",

  --AI--

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  -- "j-hui/fidget.nvim", -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  -- "renerocksai/telekasten.nvim",
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   after = "nvim-treesitter",
  --   config = function()
  --     require("headlines").setup()
  --   end,
  -- }, -- This plugin adds highlights for text filetypes, like markdown, orgmode, and neorg.

  -- -- Dart & Flutter --
  -- "dart-lang/dart-vim-plugin",
  -- "thosakwe/vim-flutter",
  -- "natebosch/vim-lsc",
  -- "natebosch/vim-lsc-dart",

  --'ThePrimeagen/harpoon',
  -- "windwp/nvim-spectre", -- Spectre find the enemy and replace them with dark power.
  -- "folke/zen-mode.nvim",
  -- -- Leap is a general-purpose motion plugin for Neovim, with the ultimate goal of establishing a
  -- -- new standard interface for moving around in the visible area in Vim-like modal editors.
  -- "nacro90/numb.nvim", -- plugin that peeks lines of the buffer in non-obtrusive way.

  -- -- Scroll --
  -- "kevinhwang91/nvim-hlslens", -- hughlite search element in scrollbar
  -- "petertriho/nvim-scrollbar", -- Scroll bar in left
  -- "karb94/neoscroll.nvim",
  -- "f-person/git-blame.nvim", -- display how last commit this code
}
