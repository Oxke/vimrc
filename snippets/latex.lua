local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function math()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local function comment()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

local function env(name)
  local env = vim.fn["vimtex#env#is_inside"](name)
  return (env[1] ~= 0 and env[2] ~= 0)
end

local function matrix()
  return env("matrix") or env("pmatrix") or env("bmatrix") or env("Bmatrix") or env("vmatrix") or env("Vmatrix")
end

local function not_math()
  return not math()
end

-- Date snippet
s({ trig = "\\?today", regTrig = true, wordTrig = true }, {
  t(os.date("%B %d, %Y")),
})

-- begin/end environment
s(
  { trig = "beg" },
  fmt(
    [[
\begin{{{}}}
	{}
\end{{{}}}
{}
]],
    { i(1), i(2), rep(1), i(0) }
  )
)

-- Inline math (context sensitive)
ls.add_snippets("tex", {
  s({ trig = "mk", condition = not_math }, { t("\\("), i(1), t("\\)"), i(0) }),
  s({ trig = "mk", condition = math }, { t("{("), i(1), t(")}"), i(0) }),
}, { key = "tex_math" })

-- Fractions
s({ trig = "//" }, { t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0) })

-- Auto-expanding brackets
local function frac_jump()
  local line = vim.fn.getline(".")
  local stripped = line:sub(1, -2)
  local depth = 0
  local i = #stripped

  while true do
    if stripped:sub(i, i) == ")" then
      depth = depth + 1
    end
    if stripped:sub(i, i) == "(" then
      depth = depth - 1
    end
    if depth == 0 then
      break
    end
    i = i - 1
  end

  return "\\frac{" .. stripped:sub(i + 1, -2) .. "}"
end

s({ trig = ".*%)/", regTrig = true }, {
  f(frac_jump),
  t("{"),
  i(1),
  t("}"),
  i(0),
})

-- Matrix environment
s(
  { trig = "mat" },
  fmt(
    [[
\begin{{{}matrix}}
	{}
\end{{{}matrix}}{}
]],
    { c(1, { t(""), t("p"), t("b"), t("B"), t("v"), t("V") }), i(2), rep(1), i(0) }
  )
)

-- Symbols and operators
local math_snippets = {
  s({ trig = "ceil", condition = math }, { t("\\left\\lceil "), i(1), t(" \\right\\rceil "), i(0) }),
  s({ trig = "floor", condition = math }, { t("\\left\\lfloor "), i(1), t(" \\right\\rfloor "), i(0) }),
  s({ trig = "lr", condition = math }, { t("\\left( "), i(1), t(" \\right) "), i(0) }),
  s({ trig = "__", condition = math }, { t("_{"), i(1), t("} "), i(0) }),
  s({ trig = "td", condition = math }, { t("^{"), i(1), t("} "), i(0) }),
}

ls.add_snippets("tex", math_snippets, { key = "math_symbols" })

-- Add more snippets following similar patterns...
