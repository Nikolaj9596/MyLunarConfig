lvim.plugins = {

  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  }, -- Move faster with unique f/F indicators for each word on the line

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },

  {
    "danymat/neogen",
    config = true,
  },

  -- GRPC *
  {
    "hudclark/grpc-nvim",
  },

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

  -- Lang -- *
  "christianchiarulli/nvim-ts-autotag", -- Added auto tag to end for ts, js html

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
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
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
  }, -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

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

  "folke/todo-comments.nvim", -- Highlights todo comments

  -- LuaSnip --
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Autopairs --
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter

  -- Plantuml --
  "aklt/plantuml-syntax",
  "weirongxu/plantuml-previewer.vim",

  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

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
    "rmagatti/goto-preview",
  },

  {
    "ThePrimeagen/harpoon",
  },
  {
    "christoomey/vim-tmux-navigator",
  },

  "MunifTanjim/nui.nvim", -- UI Component [Required for all ui]

  -- { "stevearc/dressing.nvim" }, -- important for select action

  -- {
  --   "nvimdev/lspsaga.nvim",
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require("lspsaga").setup {}
  --   end,
  -- },

  -- {
  --   "ziontee113/icon-picker.nvim",
  --   config = function()
  --     require("icon-picker").setup {
  --       disable_legacy_commands = true,
  --     }
  --   end,
  -- },

  -- { "nvim-telescope/telescope-media-files.nvim" },

  -- { "christianchiarulli/telescope-tabs", branch = "chris" },


  -- Markdown --
  -- {
  --   "AckslD/nvim-FeMaco.lua",
  --   ft = { "markdown" },
  --   opts = {},
  -- }, -- Catalyze your Fenced Markdown Code-block editing!

  -- "lewis6991/gitsigns.nvim", -- Super fast git decorations implemented purely in Lua.

  -- {
  --   "m-demare/hlargs.nvim",
  --   event = "VeryLazy",
  -- },

  -- "navarasu/onedark.nvim",

  -- Leap *
  -- {
  --   "ggandor/flit.nvim",
  --   enabled = true,
  --   keys = function()
  --     local ret = {}
  --     for _, key in ipairs { "f", "F", "t", "T" } do
  --       ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
  --     end
  --     return ret
  --   end,
  --   opts = { labeled_modes = "nx" },
  -- },
  -- {
  --   "ggandor/leap.nvim",
  --   enabled = true,
  --   keys = {
  --     { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
  --     { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
  --     { "gS", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  --   },
  --   config = function(_, opts)
  --     local leap = require "leap"
  --     for k, v in pairs(opts) do
  --       leap.opts[k] = v
  --     end
  --     leap.add_default_mappings(true)
  --     vim.keymap.del({ "x", "o" }, "x")
  --     vim.keymap.del({ "x", "o" }, "X")
  --   end,
  -- },

  -- Display processing lsp analyze

  -- "lvimuser/lsp-inlayhints.nvim", -- Partial implementation of LSP inlay hint.pl
  -- Http Request *
  -- {
  --   "jellydn/hurl.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   ft = "hurl",
  -- },

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
  --       enabled = false,
  --     },
  --     -- { "jcdickinson/codeium.nvim", config = true, enabled = false },
  --     {
  --       "jcdickinson/http.nvim",
  --       build = "cargo build --workspace --release",
  --       enabled = false,
  --     },
  --   },
  --   opts = function()
  --     local cmp = require "cmp"
  --     local luasnip = require "luasnip"
  --     local neogen = require "neogen"
  --     local icons = lvim.icons
  --     local compare = require "cmp.config.compare"
  --     local source_names = {
  --       nvim_lsp = "(LSP)",
  --       luasnip = "(Snippet)",
  --       buffer = "(Buffer)",
  --       path = "(Path)",
  --       -- codeium = "(Codeium)",
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

  --     return {
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --       },
  --       sorting = {
  --         priority_weight = 2,
  --         comparators = {
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
  --           elseif neogen.jumpable() then
  --             neogen.jump_next()
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
  --           elseif neogen.jumpable(true) then
  --             neogen.jump_prev()
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
  --         { name = "nvim_lsp", group_index = 1, max_item_count = 15 },
  --         -- { name = "codeium", group_index = 1, max_item_count = 14 },
  --         { name = "luasnip", group_index = 1, max_item_count = 16 },
  --         { name = "buffer", group_index = 2 },
  --         { name = "path", group_index = 2 },
  --         { name = "git", group_index = 2 },
  --         { name = "orgmode", group_index = 2 },
  --       },
  --       formatting = {
  --         format = function(entry, item)
  --           local max_width = 80
  --           local duplicates_default = 0
  --           if max_width ~= 0 and #item.abbr > max_width then
  --             item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
  --           end
  --           item.kind = icons.kind[item.kind]
  --           item.menu = source_names[entry.source.name]
  --           item.dup = duplicates[entry.source.name] or duplicates_default

  --           return item
  --         end,
  --       },
  --       window = {
  --         documentation = {
  --           border = "rounded",
  --           winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
  --         },
  --       },
  --     }
  --   end,
  --   config = function(_, opts)
  --     local cmp = require "cmp"
  --     cmp.setup(opts)

  --     -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  --     cmp.setup.cmdline({ "/", "?" }, {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "buffer" },
  --       },

  -- -- Scroll --
  -- "kevinhwang91/nvim-hlslens", -- hughlite search element in scrollbar
  -- "petertriho/nvim-scrollbar", -- Scroll bar in left
  -- "karb94/neoscroll.nvim",
  -- "f-person/git-blame.nvim", -- display how last commit this code
  -- {
  --   "martineausimon/nvim-bard",
  --   dependencies = "MunifTanjim/nui.nvim",
  -- },
}
