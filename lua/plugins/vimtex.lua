return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"

			vim.cmd([[
			" This is necessary for VimTeX to load properly. The "indent" is optional.
			" Note: Most plugin managers will do this automatically!
			filetype plugin indent on

			" This enables Vim's and neovim's syntax-related features. Without this, some
			" VimTeX features will not work (see ":help vimtex-requirements" for more
			" info).
			" Note: Most plugin managers will do this automatically!
			syntax enable
			]])
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip").setup()
			require("luasnip").config.set_config({
				-- enable autotriggered snippets
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
			})
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnip/" })
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
