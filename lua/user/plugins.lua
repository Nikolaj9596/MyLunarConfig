lvim.plugins = {
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap",
  -- -- LSP --
  "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.pl

  -- -- Lang --
  "christianchiarulli/nvim-ts-autotag", -- Added auto tag for ts and js
  "jose-elias-alvarez/typescript.nvim",
  -- -- "olexsmir/gopher.nvim", -- Minimalistic plugin for Go development in Neovim written in Lua.

  -- -- Useful --
  "tyru/open-browser.vim",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "moll/vim-bbye",       -- For close buffer
  "windwp/nvim-spectre", -- Spectre find the enemy and replace them with dark power.
  "mattn/webapi-vim",
  -- "folke/zen-mode.nvim",
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.
  -- -- Leap is a general-purpose motion plugin for Neovim, with the ultimate goal of establishing a
  -- -- new standard interface for moving around in the visible area in Vim-like modal editors.
  "ggandor/leap.nvim", -- plugin fore very fas finc character in line
  "nacro90/numb.nvim", -- plugin that peeks lines of the buffer in non-obtrusive way.

  -- -- Scroll --
  'kevinhwang91/nvim-hlslens', -- hughlite search element in scrollbar
  "petertriho/nvim-scrollbar", -- Scroll bar in left
  "opalmay/vim-smoothie",

  -- -- GIT --
  -- -- "TimUntersberger/neogit",
  -- "mattn/vim-gist",
  "lunarvim/github.nvim",
  "sindrets/diffview.nvim",  --Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  "ruifm/gitlinker.nvim",    --A lua neovim plugin to generate shareable file permalinks (with line ranges) for several git web frontend hosts.
  "f-person/git-blame.nvim", -- display how last commit this code

  -- -- Treesitter --
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/nvim-treesitter-refactor",
  'nvim-treesitter/nvim-tree-docs',

  -- -- DAP --
  -- -- "leoluz/nvim-dap-go",
  "mxsdev/nvim-dap-vscode-js",
  "mfussenegger/nvim-dap-python",

  -- -- Colorschemas
  "ellisonleao/gruvbox.nvim",
  "lunarvim/darkplus.nvim",
  "LunarVim/synthwave84.nvim",
  "NvChad/nvim-colorizer.lua",
  "lunarvim/templeos.nvim",

  -- -- Auto Session
  "rmagatti/auto-session",
  "rmagatti/session-lens",

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
        enabled = true,          -- enables the Noice messages UI
        view = "notify",         -- default view for messages
        view_error = "notify",   -- view for errors
        view_warn = "notify",    -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
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
    "echasnovski/mini.misc",
    config = true,
    --stylua: ignore
    keys = {
      { "<leader>z", function() require("mini.misc").zoom() end, desc = "Toggle Zoom" },
    },
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

  "folke/todo-comments.nvim", -- Highlights todo comments
  "j-hui/fidget.nvim",        -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  "renerocksai/telekasten.nvim",
  {
    "lukas-reineke/headlines.nvim",
    after = "nvim-treesitter",
    config = function()
      require("headlines").setup()
    end,
  }, -- This plugin adds highlights for text filetypes, like markdown, orgmode, and neorg.

  -- -- Dart & Flutter --
  "dart-lang/dart-vim-plugin",
  "thosakwe/vim-flutter",
  "natebosch/vim-lsc",
  "natebosch/vim-lsc-dart",

  -- -- LuaSnip --
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- -- Autopairs --
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter

  -- -- Plantuml --
  "aklt/plantuml-syntax",
  "weirongxu/plantuml-previewer.vim",

  -- -- Markdown --
  { "AckslD/nvim-FeMaco.lua",                   ft = { "markdown" }, opts = {} },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
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
  { "christianchiarulli/telescope-tabs",        branch = "chris" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-media-files.nvim" },
  -- -- CMP --
  "roobert/tailwindcss-colorizer-cmp.nvim",

  -- -- Remote --
  -- -- {
  -- --   'chipsenkbeil/distant.nvim',
  -- --   branch = 'v0.2',
  -- --   config = function()
  -- --     require('distant').setup {
  -- --       -- Applies Chip's personal settings to every machine you connect to
  -- --       --
  -- --       -- 1. Ensures that distant servers terminate with no connections
  -- --       -- 2. Provides navigation bindings for remote directories
  -- --       -- 3. Provides keybinding to jump into a remote file's parent directory
  -- --       ['*'] = require('distant.settings').chip_default()
  -- --     }
  -- --   end
  -- -- },
  -- -- DB connector --
  -- -- "kristijanhusak/vim-dadbod-ui",
  -- -- "kristijanhusak/vim-dadbod-completion",
  -- -- AI
  -- -- {
  -- --   "Exafunction/codeium.vim",
  -- --   enabled = true,
  -- --   event = "InsertEnter",
  -- --   -- stylua: ignore
  -- --   config = function()
  -- --     vim.g.codeium_disable_bindings = 1
  -- --     vim.keymap.set("i", "<A-i>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
  -- --     vim.keymap.set("i", "<A-f>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
  -- --     vim.keymap.set("i", "<A-b>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
  -- --     vim.keymap.set("i", "<A-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
  -- --     vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
  -- --   end,
  -- -- },

  -- -- "hrsh7th/cmp-nvim-lsp-signature-help", -- nvim-cmp source for displaying function signatures with the current parameter emphasized:
  -- -- {
  -- --   "RRethy/vim-illuminate",
  -- --   event = "BufReadPost",
  -- --   opts = { delay = 200 },
  -- --   config = function(_, opts)
  -- --     require("illuminate").configure(opts)
  -- --   end,
  -- -- }, -- Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  -- -- {
  -- --   "xiyaowong/nvim-transparent",
  -- --   cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
  -- --   opts = {
  -- --     extra_groups = { -- table/string: additional groups that should be cleared
  -- --       -- In particular, when you set it to 'all', that means all available groups

  -- --       -- example of akinsho/nvim-bufferline.lua "BufferLineTabClose",
  -- --       "BufferlineBufferSelected",
  -- --       "BufferLineFill",
  -- --       "BufferLineBackground",
  -- --       "BufferLineSeparator",
  -- --       "BufferLineIndicatorSelected",
  -- --     },
  -- --     exclude_groups = {}, -- table: groups you don't want to clear
  -- --   },
  -- --   config = function(_, opts)
  -- --     require("transparent").setup(opts)
  -- --   end,
  -- -- },
  -- -- {
  -- --   "catppuccin/nvim",
  -- --   lazy = true,
  -- --   name = "catppuccin",
  -- --   opts = {
  -- --     integrations = {
  -- --       alpha = true,
  -- --       cmp = true,
  -- --       gitsigns = true,
  -- --       illuminate = true,
  -- --       indent_blankline = { enabled = true },
  -- --       lsp_trouble = true,
  -- --       mason = true,
  -- --       mini = true,
  -- --       native_lsp = {
  -- --         enabled = true,
  -- --         underlines = {
  -- --           errors = { "undercurl" },
  -- --           hints = { "undercurl" },
  -- --           warnings = { "undercurl" },
  -- --           information = { "undercurl" },
  -- --         },
  -- --       },
  -- --       navic = { enabled = true, custom_bg = "lualine" },
  -- --       neotest = true,
  -- --       noice = true,
  -- --       notify = true,
  -- --       neotree = true,
  -- --       semantic_tokens = true,
  -- --       telescope = true,
  -- --       treesitter = true,
  -- --       which_key = true,
  -- --     },
  -- --   },
  -- -- },

  -- -- {
  -- --   "jcdickinson/http.nvim",
  -- --   build = "cargo build --workspace --release",
  -- --   enabled = false,
  -- -- },

  -- -- {
  -- --   "saecki/crates.nvim",
  -- --   version = "v0.3.0",
  -- --   dependencies = { "nvim-lua/plenary.nvim" },
  -- --   config = function()
  -- --     require("crates").setup {
  -- --       null_ls = {
  -- --         enabled = true,
  -- --         name = "crates.nvim",
  -- --       },
  -- --     }
  -- --   end,
  -- -- },
  -- -- AI --
  -- -- {
  -- --   "jackMort/ChatGPT.nvim",
  -- --   cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTActAs", "ChatGPTCompleteCode", "ChatGPTEditWithInstructions" },
  -- --   config = true,
  -- --   enabled = true,
  -- --   dependencies = {
  -- --     "MunifTanjim/nui.nvim",
  -- --     "nvim-lua/plenary.nvim",
  -- --     "nvim-telescope/telescope.nvim",
  -- --   },
  -- -- },
  -- -- {
  -- --   "Bryley/neoai.nvim",
  -- --   dependencies = {
  -- --     "MunifTanjim/nui.nvim",
  -- --   },
  -- --   cmd = {
  -- --     "NeoAI",
  -- --     "NeoAIOpen",
  -- --     "NeoAIClose",
  -- --     "NeoAIToggle",
  -- --     "NeoAIContext",
  -- --     "NeoAIContextOpen",
  -- --     "NeoAIContextClose",
  -- --     "NeoAIInject",
  -- --     "NeoAIInjectCode",
  -- --     "NeoAIInjectContext",
  -- --     "NeoAIInjectContextCode",
  -- --   },
  -- -- keys = {
  -- --   { "<leader>as", desc = "Summarize Text" },
  -- --   { "<leader>ag", desc = "Generate Git Message" },
  -- -- },
  -- --   config = function()
  -- --     require("neoai").setup {
  -- --       -- Options go here
  -- --     }
  -- --   end,
  -- -- },
  -- -- {
  -- --   "tzachar/cmp-tabnine",
  -- --   build = "./install.sh",
  -- -- },
  -- -- {
  -- --   "jcdickinson/codeium.nvim",
  -- --   dependencies = {
  -- --     "nvim-lua/plenary.nvim",
  -- --     "hrsh7th/nvim-cmp",
  -- --   },
  -- --   config = function()
  -- --     require("codeium").setup {}
  -- --   end,
  -- -- },

  -- -- Doc String
  -- -- {
  -- -- "kkoomen/vim-doge",
  -- -- run = ':call doge#install()'
  -- -- },
  -- -- {
  -- --   "hrsh7th/nvim-cmp",
  -- --   event = "InsertEnter",
  -- --   dependencies = {
  -- --     "hrsh7th/cmp-nvim-lsp",
  -- --     "saadparwaiz1/cmp_luasnip",
  -- --     "hrsh7th/cmp-buffer",
  -- --     "hrsh7th/cmp-path",
  -- --     "hrsh7th/cmp-cmdline",
  -- --     "petertriho/cmp-git",
  -- --     {
  -- --       "tzachar/cmp-tabnine",
  -- --       build = "./install.sh",
  -- --     },
  -- --     { "jcdickinson/codeium.nvim", config = true, enabled = false },
  -- --     {
  -- --       "jcdickinson/http.nvim",
  -- --       build = "cargo build --workspace --release",
  -- --       enabled = false,
  -- --     },
  -- --   },
  -- --   config = function()
  -- --     local cmp = require "cmp"
  -- --     local luasnip = require "luasnip"
  -- --     -- local neogen = require "neogen"
  -- --     local icons = require "lvim.icons"
  -- --     local compare = require "cmp.config.compare"
  -- --     local source_names = {
  -- --       nvim_lsp = "(LSP)",
  -- --       luasnip = "(Snippet)",
  -- --       cmp_tabnine = "(TabNine)",
  -- --       codeium = "(Codeium)",
  -- --       buffer = "(Buffer)",
  -- --       path = "(Path)",
  -- --     }

  -- --     local duplicates = {
  -- --       buffer = 1,
  -- --       path = 1,
  -- --       nvim_lsp = 0,
  -- --       luasnip = 1,
  -- --     }

  -- --     local has_words_before = function()
  -- --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  -- --     end

  -- --     cmp.setup {
  -- --       completion = {
  -- --         completeopt = "menu,menuone,noinsert",
  -- --       },
  -- --       sorting = {
  -- --         priority_weight = 2,
  -- --         comparators = {
  -- --           -- require "cmp_tabnine.compare",
  -- --           compare.score,
  -- --           compare.recently_used,
  -- --           compare.offset,
  -- --           compare.exact,
  -- --           compare.kind,
  -- --           compare.sort_text,
  -- --           compare.length,
  -- --           compare.order,
  -- --         },
  -- --       },
  -- --       snippet = {
  -- --         expand = function(args)
  -- --           require("luasnip").lsp_expand(args.body)
  -- --         end,
  -- --       },
  -- --       mapping = cmp.mapping.preset.insert {
  -- --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  -- --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  -- --         ["<C-Space>"] = cmp.mapping.complete(),
  -- --         ["<C-e>"] = cmp.mapping.abort(),
  -- --         ["<CR>"] = cmp.mapping {
  -- --           i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
  -- --           c = function(fallback)
  -- --             if cmp.visible() then
  -- --               cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
  -- --             else
  -- --               fallback()
  -- --             end
  -- --           end,
  -- --         },
  -- --         ["<C-j>"] = cmp.mapping(function(fallback)
  -- --           if cmp.visible() then
  -- --             cmp.select_next_item()
  -- --           elseif luasnip.expand_or_jumpable() then
  -- --             luasnip.expand_or_jump()
  -- --             -- elseif neogen.jumpable() then
  -- --             -- neogen.jump_next()
  -- --           elseif has_words_before() then
  -- --             cmp.complete()
  -- --           else
  -- --             fallback()
  -- --           end
  -- --         end, {
  -- --           "i",
  -- --           "s",
  -- --           "c",
  -- --         }),
  -- --         ["<C-k>"] = cmp.mapping(function(fallback)
  -- --           if cmp.visible() then
  -- --             cmp.select_prev_item()
  -- --           elseif luasnip.jumpable(-1) then
  -- --             luasnip.jump(-1)
  -- --             -- elseif neogen.jumpable(true) then
  -- --             --   neogen.jump_prev()
  -- --           else
  -- --             fallback()
  -- --           end
  -- --         end, {
  -- --           "i",
  -- --           "s",
  -- --           "c",
  -- --         }),
  -- --       },
  -- --       sources = cmp.config.sources {
  -- --         { name = "nvim_lsp_signature_help", group_index = 1 },
  -- --         { name = "nvim_lsp", group_index = 1 },
  -- --         { name = "cmp_tabnine", group_index = 1 },
  -- --         { name = "codeium", group_index = 1 },
  -- --         { name = "luasnip", group_index = 1 },
  -- --         { name = "buffer", group_index = 2 },
  -- --         { name = "path", group_index = 2 },
  -- --         { name = "git", group_index = 2 },
  -- --         { name = "orgmode", group_index = 2 },
  -- --       },

  -- --       formatting = {
  -- --         fields = { "kind", "abbr", "menu" },
  -- --         format = function(entry, item)
  -- --           local max_width = 80
  -- --           local duplicates_default = 0
  -- --           if max_width ~= 0 and #item.abbr > max_width then
  -- --             item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
  -- --           end
  -- --           item.kind = icons.kind[item.kind]
  -- --           item.menu = source_names[entry.source.name]
  -- --           item.dup = duplicates[entry.source.name] or duplicates_default

  -- --           if entry.source.name == "cmp_tabnine" then
  -- --             item.kind = ""
  -- --           elseif entry.source.name == "codeium" then
  -- --             item.kind = ""
  -- --           end
  -- --           return item
  -- --         end,
  -- --       },
  -- --     }

  -- --     -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  -- --     cmp.setup.cmdline({ "/", "?" }, {
  -- --       mapping = cmp.mapping.preset.cmdline(),
  -- --       sources = {
  -- --         { name = "buffer" },
  -- --       },
  -- --     })

  -- --     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- --     -- cmp.setup.cmdline(":", {
  -- --     --   mapping = cmp.mapping.preset.cmdline(),
  -- --     --   sources = cmp.config.sources({
  -- --     --     { name = "path" },
  -- --     --   }, {
  -- --     --     { name = "cmdline" },
  -- --     --   }),
  -- --     -- })

  -- --     -- Auto pairs
  -- --     local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  -- --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  -- --     -- Git
  -- --     require("cmp_git").setup { filetypes = { "NeogitCommitMessage" } }

  -- --     -- TabNine
  -- --     local tabnine = require "cmp_tabnine.config"
  -- --     tabnine:setup {
  -- --       max_lines = 1000,
  -- --       max_num_results = 20,
  -- --       sort = true,
  -- --       run_on_every_keystroke = true,
  -- --       snippet_placeholder = "..",
  -- --       ignored_file_types = { -- default is not to ignore
  -- --         -- uncomment to ignore in lua:
  -- --         -- lua = true
  -- --       },
  -- --     }
  -- --   end,
  -- -- },

  -- -- { "tzachar/cmp-tabnine", build = "./install.sh" },
  -- -- "jackMort/ChatGPT.nvim",
  -- -- {
  -- --   "Exafunction/codeium.vim",
  -- --   event = "InsertEnter",
  -- --   -- stylua: ignore
  -- --   config = function ()
  -- --     vim.g.codeium_disable_bindings = 1
  -- --     vim.keymap.set("i", "<A-m>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
  -- --     vim.keymap.set("i", "<A-f>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
  -- --     vim.keymap.set("i", "<A-b>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
  -- --     vim.keymap.set("i", "<A-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
  -- --     vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
  -- --   end,
  -- -- },

  -- -- "christianchiarulli/nvim-ts-rainbow",
  -- -- "mfussenegger/nvim-jdtls",
  -- -- "karb94/neoscroll.nvim",
  -- -- "ghillb/cybu.nvim",
  -- -- "kylechui/nvim-surround",
  -- -- "is0n/jaq-nvim",
  -- -- "hrsh7th/cmp-emoji",
  -- -- "monaqa/dial.nvim",
  -- -- {
  -- --   "0x100101/lab.nvim",
  -- --   build = "cd js && npm ci",
  -- -- },
  -- -- "renerocksai/calendar-vim",
  -- -- "simrat39/rust-tools.nvim",
  -- -- {
  -- --   "zbirenbaum/copilot.lua",
  -- --   -- event = { "VimEnter" },
  -- --   config = function()
  -- --     vim.defer_fn(function()
  -- --       require("copilot").setup {
  -- --         plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
  -- --       }
  -- --     end, 100)
  -- --   end,
  -- -- },
  -- -- {
  -- --   "zbirenbaum/copilot-cmp",
  -- --   after = { "copilot.lua" },
  -- --   config = function()
  -- --     require("copilot_cmp").setup {
  -- --       formatters = {
  -- --         insert_text = require("copilot_cmp.format").remove_existing,
  -- --       },
  -- --     }
  -- --   end,
  -- -- },
  -- -- "MunifTanjim/nui.nvim",
  -- -- {
  -- --   "folke/noice.nvim",
  -- --   event = "VimEnter",
  -- --   config = function()
  -- --     require("noice").setup()
  -- --   end,
  -- -- },

  -- -- https://github.com/jose-elias-alvarez/typescript.nvim
}
