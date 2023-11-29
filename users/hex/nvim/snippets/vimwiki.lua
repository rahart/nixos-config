local ls = require("luasnip") 
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.s
local i = ls.i
local t = ls.t

local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local snippets, autosnippets = {}, {}
local group = vim.api.nvim_create_augroup("Vimwiki Snippets", {clear=true})
local file_pattern = "*.md"

local tag_brain = s("tags-brain",
  fmt([[
  ---
  tags: 
  - {}
  ---
  {}
  ]],
  {
    i(1),
    i(0)
  }
  ))
table.insert(snippets, tag_brain)

local daylog = s({ trig="daylog", desc="Tag and date header for vimwiki daylog"},
  fmt([[
  ---
  tags: 
  - daylog
  ---
  # {}

  ]],
  {
    f(function () return os.date("%Y-%m-%d") end, {})
  }
  ))
table.insert(snippets, daylog)

local h1 = s("h1", fmt("# {}", {i(0)}))
table.insert(snippets, h1)
local h2 = s("h2", fmt("## {}", {i(0)}))
table.insert(snippets, h2)
local h3 = s("h3", fmt("### {}", {i(0)}))
table.insert(snippets, h3)
local h4 = s("h4", fmt("#### {}", {i(0)}))
table.insert(snippets, h4)
local h5 = s("h5", fmt("##### {}", {i(0)}))
table.insert(snippets, h5)
local h6 = s("h6", fmt("###### {}", {i(0)}))
table.insert(snippets, h6)

local bold = s("bold", fmt("*{}*", {i(0)}))
table.insert(snippets, bold)

local ref_footnote = s("ref_footnote", fmt("[^{}]", {i(0)}))
table.insert(snippets, ref_footnote)

local glo_footnote = s("glo_footnote", fmt("[^{}]: {}", {i(1), i(0)}))
table.insert(snippets, glo_footnote)



return snippets, autosnippets
