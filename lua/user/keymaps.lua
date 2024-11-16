M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

keymap("n", "<c-h>", ":wincmd h<CR>", opts)
keymap("n", "<c-j>", ":wincmd j<CR>", opts)
keymap("n", "<c-k>", ":wincmd k<CR>", opts)
keymap("n", "<c-l>", ":wincmd l<CR>", opts)

keymap("n", "C-h", ":TmuxNavigateLeft<CR>", opts)
keymap("n", "C-j", ":TmuxNavigateDown<CR>", opts)
keymap("n", "C-k", ":TmuxNavigateUp<CR>", opts)
keymap("n", "C-l", ":TmuxNavigateRight<CR>", opts)

keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc", opts)
keymap("n", "ss", ":split<cr>", opts)
keymap("n", "sv", ":vsplit<cr>", opts)
-- Leap custom keymap
keymap("n", "cs", ":lua require('leap.treesitter').select()<CR>", opts)

keymap("x", "p", [["_dP]], opts)

--Insert--
keymap("i", "jk", "<ESC>", opts)

-- Visual --
keymap("v", "r", ":HurlRunner<CR>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
-- keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
-- Better window navigation
-- keymap("n", "<S-tab>", "<c-6>", opts)

-- function _G.set_terminal_keymaps()
--   vim.api.nvim_buf_set_keymap(0, "t", "<S-h>", [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<S-j>", [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<S-k>", [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<S-l>", [[<C-\><C-n><C-W>l]], opts)
-- end

-- vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- keymap("n", "n", "nzz", opts)
-- keymap("n", "N", "Nzz", opts)
-- Doc String
-- keymap("n", "cd", "<cmd>DogeGenerate<CR>", opts)

-- keymap("v", "p", '"_dp', opts)
-- keymap("v", "P", '"_dP', opts)

-- keymap(
--   "n",
--   "<F6>",
--   [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
--   opts
-- )
-- keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)

-- keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 0)<CR>]], opts)
-- keymap("n", "<i-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)

-- keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- vim.api.nvim_set_keymap(
--   "n",
--   "<tab>",
--   "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
--   opts
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<s-tab>",
--   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
--   opts
-- )

-- vim.cmd [[
--   function! QuickFixToggle()
--     if empty(filter(getwininfo(), 'v:val.quickfix'))
--       copen
--     else
--       cclose
--     endif
--   endfunction
-- ]]

-- keymap("n", "<C-q>", ":call QuickFixToggle()<cr>", opts)

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
