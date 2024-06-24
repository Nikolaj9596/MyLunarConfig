lvim.plugins = {
  -- Rest
  {
    "jellydn/hurl.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    ft = "hurl",
  },
  -- LSP --

  "mfussenegger/nvim-jdtls",      -- Java
  "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.pl

  -- -- Lang --
  "christianchiarulli/nvim-ts-autotag", -- Added auto tag for ts and js
  -- "jose-elias-alvarez/typescript.nvim",
  -- "olexsmir/gopher.nvim", -- Minimalistic plugin for Go development in Neovim written in Lua.

  -- -- Useful --
  "tyru/open-browser.vim",
  "nvim-lua/plenary.nvim",
  "MattesGroeger/vim-bookmarks",
  "moll/vim-bbye",         -- For close buffer
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.
  "ggandor/leap.nvim",     -- plugin fore very fast find character in line
  "opalmay/vim-smoothie",
  --
  -- -- GIT --
  "TimUntersberger/neogit",
  "mattn/vim-gist",
  "lunarvim/github.nvim",
  "sindrets/diffview.nvim",  --Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  "ruifm/gitlinker.nvim",    --A lua neovim plugin to generate shareable file permalinks (with line ranges) for several git web frontend hosts.
  "f-person/git-blame.nvim", -- display how last commit this code

  -- -- Treesitter --
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-tree-docs",

  "NvChad/nvim-colorizer.lua",

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
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  "marko-cerovac/material.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- -- Auto Session
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens",

  -- -- UI --
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
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plougins use **Treesitter**
        progress = {
          enabled = true,
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          format = "lsp_progress",
          format_done = "lsp_progress_done",
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = "mini",
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = false,
          silent = true, -- set to true to not show a message if hover is not available
          view = nil,    -- when nil, use defaults from documentation
          opts = {},     -- merged with defaults from documentation
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = true,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50,  -- Debounce lsp signature help request by 50ms
          },
          view = nil,       -- when nil, use defaults from documentation
          opts = {},        -- merged with defaults from documentation
        },
        message = {
          -- Messages shown by lsp servers
          enabled = true,
          view = "notify",
          opts = {},
        },
        -- defaults for hover and signature help
        documentation = {
          view = "hover",
          opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
          },
        },
      },

      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },

      cmdline = {
        enabled = true,         -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {},              -- global options for the cmdline. See section on views
        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          -- title: set to anything or empty string to hide
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          input = {}, -- Used by input()
          -- lua = false, -- to disable a format, set to `false`
        },
      },

      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true,              -- enables the Noice messages UI
        view = "notify",             -- default view for messages
        view_error = "notify",       -- view for errors
        view_warn = "notify",        -- view for warnings
        view_history = "messages",   -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      popupmenu = {
        enabled = true,  -- enables the Noice popupmenu UI
        backend = "nui", -- backend to use to show regular cmdline completions
        kind_icons = {}, -- set to `false` to disable icons
      },
    },
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
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

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
  { "christianchiarulli/telescope-tabs",        branch = "chris" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
      { "tpope/vim-dadbod",                     lazy = true },
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
  {
    "christoomey/vim-tmux-navigator",
  },
  { "stevearc/dressing.nvim" }, -- important for select action
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

  -- "windwp/nvim-spectre", -- Spectre find the enemy and replace them with dark power.
  -- "folke/zen-mode.nvim",
  -- -- Leap is a general-purpose motion plugin for Neovim, with the ultimate goal of establishing a
  -- -- new standard interface for moving around in the visible area in Vim-like modal editors.
  -- "nacro90/numb.nvim", -- plugin that peeks lines of the buffer in non-obtrusive way.

  -- -- Scroll --
  -- "kevinhwang91/nvim-hlslens", -- hughlite search element in scrollbar
  -- "petertriho/nvim-scrollbar", -- Scroll bar in left
  -- "karb94/neoscroll.nvim",
}
