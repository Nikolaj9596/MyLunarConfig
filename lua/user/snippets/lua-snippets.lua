local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local group = vim.api.nvim_create_augroup("Python Snippets", { clear = true })
-- Example --
ls.add_snippets("lua", {
  s({ trig = "digit(%d)(%d)", regTrig = true, snippetType = "autosnippet" }, {
    f(function(_, snip)
      return snip.captures[1] .. " and "
    end),
    f(function(_, snip)
      return snip.captures[2]
    end),
  }),
})

ls.add_snippets("lua", {
  s({ trig = "di(%d)(%d)", regTrig = true, snippetType = "autosnippet" }, {
    i(1, "Uppder case me"),
    f(function(arg, _)
      return arg[1][1]:upper() .. arg[2][1]:lower()
    end, { 1, 2 }),
    i(2, "lower case me"),
  }),
})
