local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local extras = require "luasnip.extras"
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
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
import {{ FC }} from "react";
import {{ useTranslation }} from "react-i18next";
import {{ classNames }} from "shared";
import cls from "./{}.module.scss";

interface {}Props {{
  className?: string;
}}

export const {}:FC<{}Props> = (props) => {{
  const {{ t }} = useTranslation()
  return (
    <div className={{classNames(cls.{}, {{}}, [props.className])}}>
    </div>
  );
}};
    ]],
        {
          i(1, "ComponentName"),
          rep(1),
          rep(1),
          rep(1),
          rep(1)
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
