local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end
local labels = snip("klabel", 
fmt(
[[
  labels:
    {}: {}
]], {insert(1), insert(2)}))
--local sig = snip("signature", "-- TH, ", date) 
ls.add_snippets(nil, {
  all = {
    snip(
      "kdeny",
      fmta([[
      apiVersion: networking.k8s.io/v1
      kind: NetworkPolicy
      metadata:
        name: deny-all
        namespace: <>
      spec:
        podSelector: {} # {} is wildcard for all pods in podSelector
        policyTypes:
        - Ingress # no rules means deny-all
        - Egress # no rules means deny-all
      ]], 
      {
        insert(1,namespace),
      })
    ),
    snip(
      "knamespace",
      fmta([[
      apiVersion: v1
      kind: Namespace
      metadata:
        name: <>
        labels:
          name: <>
          environment: <>
      ]],
      {
        insert(1),
        rep(1),
        insert(2),
      })
    ),
  },
})

