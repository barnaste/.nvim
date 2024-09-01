return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},
	{ "hrsh7th/cmp-buffer",   event = "InsertEnter" },
	{ "hrsh7th/cmp-path",     event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			local ELLIPSIS_CHAR = "..."
			local MAX_LABEL_WIDTH = 20
			local MIN_LABEL_WIDTH = 20
			cmp.setup({
				formatting = {
					fields = { "abbr", "kind", "menu" },
					-- fix the size of labels
					format = function(_, vim_item)
						local label = vim_item.abbr
						if string.len(label) > MAX_LABEL_WIDTH then
							label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH - string.len(ELLIPSIS_CHAR))
						elseif string.len(label) < MIN_LABEL_WIDTH then
							local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
							label = label .. padding
						end
						vim_item.abbr = label

						label = vim_item.kind
						if string.len(label) > (MAX_LABEL_WIDTH / 2) then
							label = vim.fn.strcharpart(label, 0, (MAX_LABEL_WIDTH / 2) - string.len(ELLIPSIS_CHAR))
						elseif string.len(label) < (MIN_LABEL_WIDTH / 2) then
							local padding = string.rep(" ", (MIN_LABEL_WIDTH / 2) - string.len(label))
							label = label .. padding
						end
						vim_item.kind = label

						vim_item.menu = ""
						return vim_item
					end,
				},

				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- use luasnip as a snippet "expansion" function
						require("luasnip").lsp_expand(args.body)
					end,
				},

				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),

					-- SUPERTAB SETUP
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer",  option = { keyword_pattern = [[\k\+]] } },
					{ name = "path" },
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
				}, {
					{ name = "buffer" },
				}),
			})

			-- insert '(' after selecting a function
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
