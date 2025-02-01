return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()
		vim.keymap.set("n", "]c", function()
			require("todo-comments").jump_next()
		end, {})
		vim.keymap.set("n", "[c", function()
			require("todo-comments").jump_prev()
		end, {})
		vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", {})
	end,
}
