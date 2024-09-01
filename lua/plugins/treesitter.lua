return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"java",
				"latex",
				"lua",
				"python",
				"regex",
				"rust",
			},
			--auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			additional_vim_regex_highlighting = false,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ts",
					node_incremental = "<leader>ts",
					scope_incremental = false,
					node_decremental = "<leader>td",
				},
			},
		})

		-- NOTE determine treesitter captures (e.g. @comment.note.comment) via :Inspect
		-- NOTE determine the highlight groups (e.g. TSRainbowOrange) via :Telescope highlights
		vim.api.nvim_set_hl(0, "@comment.note.comment", { link = "TSRainbowOrange" })
	end,
}
