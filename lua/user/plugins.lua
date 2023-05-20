lvim.plugins = {
  -- Remote --
  -- {
  --   'chipsenkbeil/distant.nvim',
  --   branch = 'v0.2',
  --   config = function()
  --     require('distant').setup {
  --       -- Applies Chip's personal settings to every machine you connect to
  --       --
  --       -- 1. Ensures that distant servers terminate with no connections
  --       -- 2. Provides navigation bindings for remote directories
  --       -- 3. Provides keybinding to jump into a remote file's parent directory
  --       ['*'] = require('distant.settings').chip_default()
  --     }
  --   end
  -- },
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",
  -- LSP --
  "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.pl

  -- Lang --
  "christianchiarulli/nvim-ts-autotag",
  "jose-elias-alvarez/typescript.nvim",
  -- "olexsmir/gopher.nvim", -- Minimalistic plugin for Go development in Neovim written in Lua.

  -- Useful --
  "tyru/open-browser.vim",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "moll/vim-bbye", -- For close buffer
  "windwp/nvim-spectre", -- Spectre find the enemy and replace them with dark power.
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "kevinhwang91/nvim-bqf", -- The goal of nvim-bqf is to make Neovim's quickfix window better.
  -- Leap is a general-purpose motion plugin for Neovim, with the ultimate goal of establishing a
  -- new standard interface for moving around in the visible area in Vim-like modal editors.
  "ggandor/leap.nvim",
  "nacro90/numb.nvim", -- plugin that peeks lines of the buffer in non-obtrusive way.

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
  -- "nvim-treesitter/nvim-treesitter-textobjects",

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
    "lukas-reineke/headlines.nvim",
    after = "nvim-treesitter",
    config = function()
      require("headlines").setup()
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
  -- {
  --   "kkoomen/vim-doge",
  --   -- run = ':call doge#install()'
  -- },

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
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTActAs", "ChatGPTCompleteCode", "ChatGPTEditWithInstructions" },
    config = true,
    enabled = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    -- keys = {
    --   { "<leader>as", desc = "Summarize Text" },
    --   { "<leader>ag", desc = "Generate Git Message" },
    -- },
    config = function()
      require("neoai").setup {
        -- Options go here
      }
    end,
  },
  -- {
  --   "tzachar/cmp-tabnine",
  --   build = "./install.sh",
  -- },
  -- {
  --   "jcdickinson/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup {}
  --   end,
  -- },
  {
    "Exafunction/codeium.vim",
    enabled = true,
    event = "InsertEnter",
    -- stylua: ignore
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<A-i>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<A-f>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<A-b>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<A-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
    end,
  },

  -- CMP --
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "jcdickinson/http.nvim",
    build = "cargo build --workspace --release",
    enabled = false,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "saadparwaiz1/cmp_luasnip",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     "petertriho/cmp-git",
  --     {
  --       "tzachar/cmp-tabnine",
  --       build = "./install.sh",
  --     },
  --     { "jcdickinson/codeium.nvim", config = true, enabled = false },
  --     {
  --       "jcdickinson/http.nvim",
  --       build = "cargo build --workspace --release",
  --       enabled = false,
  --     },
  --   },
  --   config = function()
  --     local cmp = require "cmp"
  --     local luasnip = require "luasnip"
  --     -- local neogen = require "neogen"
  --     local icons = require "lvim.icons"
  --     local compare = require "cmp.config.compare"
  --     local source_names = {
  --       nvim_lsp = "(LSP)",
  --       luasnip = "(Snippet)",
  --       cmp_tabnine = "(TabNine)",
  --       codeium = "(Codeium)",
  --       buffer = "(Buffer)",
  --       path = "(Path)",
  --     }

  --     local duplicates = {
  --       buffer = 1,
  --       path = 1,
  --       nvim_lsp = 0,
  --       luasnip = 1,
  --     }

  --     local has_words_before = function()
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  --     end

  --     cmp.setup {
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --       },
  --       sorting = {
  --         priority_weight = 2,
  --         comparators = {
  --           -- require "cmp_tabnine.compare",
  --           compare.score,
  --           compare.recently_used,
  --           compare.offset,
  --           compare.exact,
  --           compare.kind,
  --           compare.sort_text,
  --           compare.length,
  --           compare.order,
  --         },
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert {
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping {
  --           i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
  --           c = function(fallback)
  --             if cmp.visible() then
  --               cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
  --             else
  --               fallback()
  --             end
  --           end,
  --         },
  --         ["<C-j>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --             -- elseif neogen.jumpable() then
  --             -- neogen.jump_next()
  --           elseif has_words_before() then
  --             cmp.complete()
  --           else
  --             fallback()
  --           end
  --         end, {
  --           "i",
  --           "s",
  --           "c",
  --         }),
  --         ["<C-k>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           elseif luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --             -- elseif neogen.jumpable(true) then
  --             --   neogen.jump_prev()
  --           else
  --             fallback()
  --           end
  --         end, {
  --           "i",
  --           "s",
  --           "c",
  --         }),
  --       },
  --       sources = cmp.config.sources {
  --         { name = "nvim_lsp_signature_help", group_index = 1 },
  --         { name = "nvim_lsp", group_index = 1 },
  --         { name = "cmp_tabnine", group_index = 1 },
  --         { name = "codeium", group_index = 1 },
  --         { name = "luasnip", group_index = 1 },
  --         { name = "buffer", group_index = 2 },
  --         { name = "path", group_index = 2 },
  --         { name = "git", group_index = 2 },
  --         { name = "orgmode", group_index = 2 },
  --       },

  --       formatting = {
  --         fields = { "kind", "abbr", "menu" },
  --         format = function(entry, item)
  --           local max_width = 80
  --           local duplicates_default = 0
  --           if max_width ~= 0 and #item.abbr > max_width then
  --             item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
  --           end
  --           item.kind = icons.kind[item.kind]
  --           item.menu = source_names[entry.source.name]
  --           item.dup = duplicates[entry.source.name] or duplicates_default

  --           if entry.source.name == "cmp_tabnine" then
  --             item.kind = ""
  --           elseif entry.source.name == "codeium" then
  --             item.kind = ""
  --           end
  --           return item
  --         end,
  --       },
  --     }

  --     -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  --     cmp.setup.cmdline({ "/", "?" }, {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "buffer" },
  --       },
  --     })

  --     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --     -- cmp.setup.cmdline(":", {
  --     --   mapping = cmp.mapping.preset.cmdline(),
  --     --   sources = cmp.config.sources({
  --     --     { name = "path" },
  --     --   }, {
  --     --     { name = "cmdline" },
  --     --   }),
  --     -- })

  --     -- Auto pairs
  --     local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  --     -- Git
  --     require("cmp_git").setup { filetypes = { "NeogitCommitMessage" } }

  --     -- TabNine
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --       run_on_every_keystroke = true,
  --       snippet_placeholder = "..",
  --       ignored_file_types = { -- default is not to ignore
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --       },
  --     }
  --   end,
  -- },

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
