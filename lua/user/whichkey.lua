lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["h"] = { "<cmd>nohlsearch<cr>", "nohl" }
lvim.builtin.which_key.mappings["q"] = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" }
lvim.builtin.which_key.mappings["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["gy"] = "Link"
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  w = { "<cmd>Lspsaga rename<cr>", "Replace Word" },
}

lvim.builtin.which_key.mappings["o"] = {
  name = "Obsidian",
  n = { "<cmd>ObsidianNew<CR>", "Create new note" },
  s = { "<cmd>ObsidianSearch<CR>", "Search note" },
  t = { "<cmd>ObsidianToday<CR>", "Create delay note" },
  T = { "<cmd>ObsidianTags<CR>", "Search note by tags" },
  l = { "<cmd>ObsidianLink<CR>", "Create link on note" },
  r = { "<cmd>ObsidianRename<CR>", "Rename note" },
  c = { "<cmd>ObsidianToggleCheckbox<CR>", "Toggle Checkbox" },
}

lvim.builtin.which_key.mappings["R"] = {
  name = "Rest",
  r = { "<cmd>HurlRunner<CR>", "Run All requests" },
  a = { "<cmd>HurlRunnerAt<cr>", "Run Api request" },
  e = { "<cmd>HurlRunnerToEntry<cr>", "Run Api request to entry" },
  t = { "<cmd>HurlToggleMode<cr>", "Hurl Toggle Mode" },
  v = { "<cmd>HurlVerbose<cr>", "Hurl Verbose" },
  l = { "<cmd>HurlShowLastResponse<cr>", "Hurl Show Last Response" },
  m = { "<cmd>HurlManageVariable<cr>", "Hurl Manage Variable" },
  s = { ":HurlSetVariable ", "Hurl Set Variable" },
  f = { ":HurlSetEnvFile ", "Hurl Set Env File" },
}

lvim.builtin.which_key.mappings["D"] = {
  name = "Debug",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
  O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
  l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
  u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
}
-- Database
lvim.builtin.which_key.mappings["d"] = {
  name = "Database",
  u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
  f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
  r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
  q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
  -- 'postgres://postgres:mypassword@localhost:5432/my-dev-db',
  -- 'mysql://root@localhost/wp_awesome',
  -- 'redis:///localhost:5432/my-dev-db',
}

lvim.builtin.which_key.mappings["a"] = {
  name = "Tab",
  n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
  N = { "<cmd>tabnew %<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Tab Close" }
}

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  s = { "<cmd>Telescope grep_string<cr>", "Find String" },
  h = { "<cmd>Telescope help_tags<cr>", "Help" },
  H = { "<cmd>Telescope highlights<cr>", "Highlights" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  i = { "<cmd>IconPickerNormal<cr>", "Icon" },
}

lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  g = { "<cmd>lua require 'user.terminal'.lazygit_toggle()<cr>", "Lazygit" },
  l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Git Blame" },
  n = { ":!git checkout -b ", "Checkout New Branch" },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Diff",
  },
  G = { "<cmd>Neogit<cr>", "Neogit" },
  j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  u = {
  "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
  "Undo Stage Hunk",
  },
  -- G = {
  --   name = "Gist",
  --   a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
  --   d = { "<cmd>Gist -d<cr>", "Delete" },
  --   f = { "<cmd>Gist -f<cr>", "Fork" },
  --   g = { "<cmd>Gist -b<cr>", "Create" },
  --   l = { "<cmd>Gist -l<cr>", "List" },
  --   p = { "<cmd>Gist -b -p<cr>", "Create Private" },
  -- },
}

lvim.builtin.which_key.mappings["l"] = {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
  I = { "<cmd>Mason<cr>", "Mason" },
  l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },
  w = {
    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    "Workspace Diagnostics",
  },
  j = {
    "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
    "Prev Diagnostic",
  },
  o = { "<cmd>Lspsaga outline<cr>", "Outline" },
  -- H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
  -- u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
  -- q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
  -- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  -- R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  -- t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
  -- d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
  -- F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
  -- c = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Get Capabilities" },
  -- c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
  -- v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "Terminal",
  u = { "<cmd>lua require 'user.terminal'.ncdu_toggle()<cr>", "NCDU" },
  t = { "<cmd>lua require 'user.terminal'.htop_toggle()<cr>", "Htop" },
  d = { "<cmd>lua require 'user.terminal'.lazydocker_toggle()<cr>", "Lazydocker" },
  p = { "<cmd>lua require 'user.terminal'.ipython_toggle()<cr>", "IPython" },
  k = { "<cmd>lua require 'user.terminal'.k9s_toggle()<cr>", "K9s" },
  f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  
  -- n = { "<cmd>lua require 'user.terminal'.node_toggle()<cr>", "Node" },
  -- c = { "<cmd>lua require 'user.terminal'.ctop_toggle()<cr>", "Ctop" },
  -- h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  -- v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
}

lvim.builtin.which_key.mappings["n"] = {
  name = "Notes",
  n = { "<cmd>ObsNvimFollowLink<cr>", "ObsFollowLink" },
  -- r = { "<cmd>ObsNvimRandomNote<cr>", "ObsRandomNote" },
  N = { "<cmd>ObsNvimNewNote<cr>", "ObsNewNote" },
  d = { "<cmd>ObsNvimDailyNote<cr>", "ObsDailyNote" },
  r = { "<cmd>ObsNvimRename<cr>", "ObsRename" },
  T = { "<cmd>ObsNvimTemplate<cr>", "ObsTemplate" },
  M = { "<cmd>ObsNvimMove<cr>", "ObsMove" },
  b = { "<cmd>ObsNvimBacklinks<cr>", "ObsBacklinks" },
  j = { "<cmd>ObsNvimFindInJournal<cr>", "ObsFindInJournal" },
  f = { "<cmd>ObsNvimFindNote<cr>", "ObsFindNote" },
  g = { "<cmd>ObsNvimFindInNotes<cr>", "ObsFindInNotes" },
}

lvim.builtin.which_key.mappings[";"] = nil
-- lvim.builtin.which_key.mappings["c"] = nil
lvim.builtin.which_key.mappings["L"] = nil
lvim.builtin.which_key.mappings["s"] = nil
-- lvim.builtin.which_key.mappings["w"] = nil

local m_opts = {
  mode = "n",     -- NORMAL mode
  prefix = "m",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local m_mappings = {
  a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
  c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  m = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
  j = { "<cmd>silent BookmarkNext<cr>", "Next" },
  k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
  S = { "<cmd>silent BookmarkShowAll<cr>", "Show All" },
  s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  b = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
  [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}
which_key.register(m_mappings, m_opts)
