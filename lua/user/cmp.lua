  -- format = require("tailwindcss-colorizer-cmp").formatter,
lvim.builtin.cmp.formatting = {
  format = require('lspkind').cmp_format({
              mode = "symbol",
              maxwidth = 50,
              ellipsis_char = '...',
              symbol_map = { Codeium = "", }
          })
}
lvim.builtin.cmp.window.documentation = true
lvim.builtin.cmp.window.documentation = {
  border = "rounded",
  winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}
lvim.builtin.cmp.window.completion = {
  border = "rounded",
  winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}
lvim.builtin.cmp.formatting.source_names = {
  nvim_lsp = "",
  emoji = "",
  path = "",
  calc = "",
  cmp_tabnine = "",
  vsnip = "",
  luasnip = "",
  buffer = "",
  tmux = "",
  copilot = "",
  treesitter = "",
  codium = "codium"
}


