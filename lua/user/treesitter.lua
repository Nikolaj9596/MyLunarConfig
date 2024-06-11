require "nvim-treesitter.configs".setup {
  tree_docs = {enable = true}
}

if lvim.colorscheme == "darkplus" then
-- if lvim.colorscheme == "gruvbox" then
-- if lvim.colorscheme == "lunar" then
-- if lvim.colorscheme == "onedark" then
-- if lvim.colorscheme == "solarized-osaka" then
-- if lvim.colorscheme == "catppuccin-macchiato" then
  lvim.builtin.treesitter.rainbow = {
    enable = true,
    extended_mode = false,
    colors = {
      "DodgerBlue",
      "Orchid",
      "Gold",
    },
    disable = { "html" },
  }
end

-- lvim.builtin.treesitter.highlight = {
--   enable = true,
--   additional_vim_regex_highlighting = { "php" },
-- }

lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "bash",
  "c",
  "json",
  "java",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
  "markdown",
  "markdown_inline",
  "html",
  "dart",
  "toml",
  "dockerfile",
  "c_sharp",
  "gitignore",
  "gitcommit",
  "scss",
  "sql",
  "htmldjango",
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "markdown" }

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["at"] = "@class.outer",
      ["it"] = "@class.inner",
      ["ac"] = "@call.outer",
      ["ic"] = "@call.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["ai"] = "@conditional.outer",
      ["ii"] = "@conditional.inner",
      ["a/"] = "@comment.outer",
      ["i/"] = "@comment.inner",
      ["ab"] = "@block.outer",
      ["ib"] = "@block.inner",
      ["as"] = "@statement.outer",
      ["is"] = "@scopename.inner",
      ["aA"] = "@attribute.outer",
      ["iA"] = "@attribute.inner",
      ["aF"] = "@frame.outer",
      ["iF"] = "@frame.inner",
    },
  },
}
