M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<c-j>", "<c-d>", opts)
keymap("n", "<c-k>", "<c-u>", opts)
keymap("n", "<c-m>", "<s-m>", opts)

keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

-- vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc", opts)

--Insert--
keymap("i", "jk", "<ESC>", opts)

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

-- Tabs --
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "<s-\\>", ":tabclose<cr>", opts)
-- keymap("n", "<s-\\>", ":tabonly<cr>", opts)


-- keymap("n", "n", "nzz", opts)
-- keymap("n", "N", "Nzz", opts)
-- Doc String
-- keymap("n", "cd", "<cmd>DogeGenerate<CR>", opts)

-- Visual --
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
