return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim",
	-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
	-- NOTE determine treesitter captures (e.g. @comment.note.comment) via :Inspect
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = bg0 })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = bg0 })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = bg0 })
	vim.keymap.set('n', '<leader>/', ':Neotree filesystem reveal left toggle<CR>', {})
  end
}
