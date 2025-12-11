return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
	},
	config = function()
		require("todo-comments").setup({
			keywords = {
				NOTE = { icon = " ", alt = { "INFO" } },
			},
			colors = {
				hint = { "DiagnosticHint", "#10B981" },
			},
		})

		-- set hint highlight group to green colour
		local line_hl = vim.api.nvim_get_hl(0, { name = "StatusLineTerm" })
		vim.api.nvim_set_hl(0, "DiagnosticHint", line_hl)

		vim.keymap.set("n", "]c", function()
			require("todo-comments").jump_next()
		end, {})
		vim.keymap.set("n", "[c", function()
			require("todo-comments").jump_prev()
		end, {})
		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", {})
	end,
}
