local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

M = {
	s( -- cast snippet only when not preceeded by an alpha character
		{ trig = "([^%a])mk", snippetType = "autosnippet", wordTrig = false, regTrig = true },
		fmta("<>$<>$", { f(function(_, snip)
			return snip.captures[1]
		end), i(1) })
	),
	s( -- allow also for the case where snippet is cast at start of line
		{ trig = "^mk", snippetType = "autosnippet", wordTrig = false, regTrig = true },
		fmta("<>$<>$", { f(function(_, snip)
			return snip.captures[1]
		end), i(1) }),
		{ condition = line_begin }
	),

	-- math mode
	s( -- cast snippet only when not preceeded by an alpha character
		{ trig = "([^%a])dm", snippetType = "autosnippet", wordTrig = false, regTrig = true },
		fmta("<>$ <> $", { f(function(_, snip)
				return snip.captures[1]
			end), i(1) }
		)
	),
	s( -- allow also for the case where snippet is cast at start of line
		{ trig = "dm", snippetType = "autosnippet", wordTrig = false, regTrig = true },
		fmta("<>$ <> $", { f(function(_, snip)
				return snip.captures[1]
			end), i(1) }
		),
		{ condition = line_begin }
	),
}

return M
