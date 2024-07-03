-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "gruvbox"
-- lvim.colorscheme = "darkplus"
-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "solarized-osaka"
lvim.colorscheme = "catppuccin-macchiato"
lvim.log.level = "warning"

lvim.builtin.alpha.active = false
lvim.reload_config_on_save = true
lvim.builtin.illuminate.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.terminal.active = true
lvim.builtin.breadcrumbs.active = false
lvim.builtin.dap.active = true
lvim.builtin.autopairs.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.cmp.cmdline.enable = true

-- lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.nvimtree.setup.view.mappings.custom_only = true
-- lvim.keys.term_mode = { ["<C-l>"] = false }

vim.diagnostic.config {
  virtual_text = false,
  float = {
    focusable = true,
  },
}

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- foldmethod = "indent",
-- foldlevel = 0,

local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 2, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 0,
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
  -- colorcolumn = "80",
  -- colorcolumn = "120",
}

vim.opt.showtabline = 0
vim.opt.fillchars.eob = " "
vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "

for k, v in pairs(options) do
  vim.opt[k] = v
end

