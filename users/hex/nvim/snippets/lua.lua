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
local group = vim.api.nvim_create_augroup("Lua Snippets", {clear=true})
local file_pattern = "*.md"

return snippets, autosnippets
