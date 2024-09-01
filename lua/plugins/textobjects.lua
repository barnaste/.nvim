return {
	{
		"wellle/targets.vim",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- assignment text object
							["a="] = "@assignment.outer",
							["i="] = "@assignment.inner",
							["l="] = "@assignment.lhs",
							["r="] = "@assignment.rhs",

							-- [C]onditional text object
							["ac"] = "@conditional.outer",
							["ic"] = "@conditional.inner",

							-- loop ([I]teration) text object
							["ai"] = "@loop.outer",
							["ii"] = "@loop.inner",

							-- [F]unction definition text object
							["af"] = "@function.outer",
							["if"] = "@function.inner",

							-- class ([O]bject) text object
							["ao"] = "@class.outer",
							["io"] = "@class.inner",
						},

						include_surrounding_whitespace = false,
					},

					swap = {
						enable = true,
						swap_next = {
							["<leader>na"] = "@parameter.inner",
							["<leader>nf"] = "@function.outer",
						},
						swap_previous = {
							["<leader>la"] = "@parameter.inner",
							["<leader>lf"] = "@function.outer",
						},
					},

					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]a"] = "@parameter.inner",
							["]f"] = "@function.outer",
							["]="] = "@assignment.outer",
							["]c"] = "@conditional.inner",
						},
						goto_next_end = {
							["]A"] = "@parameter.inner",
							["]D"] = "@function.outer",
							["]C"] = "@conditional.inner",
						},
						goto_previous_start = {
							["[a"] = "@parameter.inner",
							["[f"] = "@function.outer",
							["[="] = "@assignment.outer",
							["[c"] = "@conditional.inner",
						},
						goto_previous_end = {
							["[A"] = "@parameter.inner",
							["[D"] = "@function.outer",
							["[C"] = "@conditional.inner",
						},
					},
				},
			})
		end,
	},
}
