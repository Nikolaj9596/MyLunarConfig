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
-- local snippets, autosnipets = {}, {}
-- local file_pattern = ".lua"
-- JS for --
local lengs = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

local function addSnippet(leng)
  --   ls.add_snippets(leng, {
  --     s(
  --       { trig = "for([%w_]+)", regTrig = true, snippetType = "autosnippet" },
  --       fmt(
  --         [[
  --   for (let {} = 0; {} < {}; {}++) {{
  --     {}
  --   }}

  --   {}
  --       ]],
  --         {
  --           d(1, function(_, snip)
  --             return sn(1, i(1, snip.captures[1]))
  --           end),
  --           rep(1),
  --           c(2, { i(1, "num"), sn(1, { i(1, "arr"), t ".length" }) }),
  --           rep(1),
  --           i(3, "// TODO:"),
  --           i(4, ""),
  --         }
  --       )
  --     ),
  --   })

  ls.add_snippets(leng, {
    s(
      { trig = "rc", snippetType = "snippet" },
      fmt(
        [[
import React from "react";
import cls from "./{}.module.scss";

const {} = (props) => {{
  return (
    <div className={{cls.{}}}>
    </div>
  );
}};

export default {};
    ]],
        {
          i(1, "ComponentName"),
          rep(1),
          i(2, "selectorName"),
          rep(1),
        }
      )
    ),
  })

  ls.add_snippets(leng, {
    s(
      { trig = "rsf", snippetType = "snippet" },
      fmt(
        [[

{} {} = ({}) => {{
  return {}
  }};

    ]],
        {
          i(1, "let"),
          i(2, ""),
          i(3, "FunctioName"),
          i(4, "Return"),
        }
      )
    ),
  })
end

for leng = 1, 4 do
  addSnippet(lengs[leng])
end
