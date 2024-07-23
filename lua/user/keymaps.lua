M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

-- keymap("n", "<S-h>", "<C-w>h", opts)
-- keymap("n", "<S-j>", "<C-w>j", opts)
-- keymap("n", "<S-k>", "<C-w>k", opts)
-- keymap("n", "<S-l>", "<C-w>l", opts)

keymap("n", "<c-h>", ":wincmd h<CR>", opts)
keymap("n", "<c-j>", ":wincmd j<CR>", opts)
keymap("n", "<c-k>", ":wincmd k<CR>", opts)
keymap("n", "<c-l>", ":wincmd l<CR>", opts)
keymap('n', 'C-h', ':TmuxNavigateLeft<CR>', opts)
keymap('n', 'C-j', ':TmuxNavigateDown<CR>', opts)
keymap('n', 'C-k', ':TmuxNavigateUp<CR>', opts)
keymap('n', 'C-l', ':TmuxNavigateRight<CR>', opts)

keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)

keymap("n", "ss", ":split<cr>", opts)
keymap("n", "sv", ":vsplit<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc", opts)

--Insert--
keymap("i", "jk", "<ESC>", opts)

-- Visual --
keymap("v", "g", ':HurlRunner<CR>', opts)



M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end
return M
