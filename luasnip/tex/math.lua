local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

M = {
	-- greek letters
	s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }, { condition = in_mathzone }),
	s({ trig = ";A", snippetType = "autosnippet" }, { t("\\Alpha") }, { condition = in_mathzone }),
	s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }, { condition = in_mathzone }),
	s({ trig = ";B", snippetType = "autosnippet" }, { t("\\Beta") }, { condition = in_mathzone }),
	s({ trig = ";c", snippetType = "autosnippet" }, { t("\\chi") }, { condition = in_mathzone }),
	s({ trig = ";C", snippetType = "autosnippet" }, { t("\\Chi") }, { condition = in_mathzone }),
	s({ trig = ";d", snippetType = "autosnippet" }, { t("\\delta") }, { condition = in_mathzone }),
	s({ trig = ";D", snippetType = "autosnippet" }, { t("\\Delta") }, { condition = in_mathzone }),
	s({ trig = ";e", snippetType = "autosnippet" }, { t("\\varepsilon") }, { condition = in_mathzone }),
	s({ trig = ";E", snippetType = "autosnippet" }, { t("\\epsilon") }, { condition = in_mathzone }),
	s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }, { condition = in_mathzone }),
	s({ trig = ";G", snippetType = "autosnippet" }, { t("\\Gamma") }, { condition = in_mathzone }),
	s({ trig = ";i", snippetType = "autosnippet" }, { t("\\iota") }, { condition = in_mathzone }),
	s({ trig = ";k", snippetType = "autosnippet" }, { t("\\kappa") }, { condition = in_mathzone }),
	s({ trig = ";l", snippetType = "autosnippet" }, { t("\\lambda") }, { condition = in_mathzone }),
	s({ trig = ";L", snippetType = "autosnippet" }, { t("\\Lambda") }, { condition = in_mathzone }),
	s({ trig = ";m", snippetType = "autosnippet" }, { t("\\mu") }, { condition = in_mathzone }),
	s({ trig = ";n", snippetType = "autosnippet" }, { t("\\eta") }, { condition = in_mathzone }),
	s({ trig = ";o", snippetType = "autosnippet" }, { t("\\omega") }, { condition = in_mathzone }),
	s({ trig = ";O", snippetType = "autosnippet" }, { t("\\Omega") }, { condition = in_mathzone }),
	s({ trig = ";pi", snippetType = "autosnippet" }, { t("\\pi") }, { condition = in_mathzone }),
	s({ trig = ";Pi", snippetType = "autosnippet" }, { t("\\Pi") }, { condition = in_mathzone }),
	s({ trig = ";Ph", snippetType = "autosnippet" }, { t("\\Phi") }, { condition = in_mathzone }),
	s({ trig = ";ph", snippetType = "autosnippet" }, { t("\\phi") }, { condition = in_mathzone }),
	s({ trig = ";ps", snippetType = "autosnippet" }, { t("\\psi") }, { condition = in_mathzone }),
	s({ trig = ";Ps", snippetType = "autosnippet" }, { t("\\Psi") }, { condition = in_mathzone }),
	s({ trig = ";r", snippetType = "autosnippet" }, { t("\\rho") }, { condition = in_mathzone }),
	s({ trig = ";s", snippetType = "autosnippet" }, { t("\\sigma") }, { condition = in_mathzone }),
	s({ trig = ";S", snippetType = "autosnippet" }, { t("\\Sigma") }, { condition = in_mathzone }),
	s({ trig = ";t", snippetType = "autosnippet" }, { t("\\tau") }, { condition = in_mathzone }),
	s({ trig = ";u", snippetType = "autosnippet" }, { t("\\upsilon") }, { condition = in_mathzone }),
	s({ trig = ";v", snippetType = "autosnippet" }, { t("\\nu") }, { condition = in_mathzone }),
	s({ trig = ";x", snippetType = "autosnippet" }, { t("\\xi") }, { condition = in_mathzone }),
	s({ trig = ";X", snippetType = "autosnippet" }, { t("\\Xi") }, { condition = in_mathzone }),
	s({ trig = ";z", snippetType = "autosnippet" }, { t("\\zeta") }, { condition = in_mathzone }),

	-- fraction
	s(
		{ trig = "//", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", { i(1), i(2) }),
		{ condition = in_mathzone }
	),
}

return M
