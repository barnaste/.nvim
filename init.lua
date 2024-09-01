-- tab configurations
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- relative line numbering
vim.wo.relativenumber = true

-- don't show mode: useful while lualine is enabled
vim.opt.showmode = false

-- add signcolumn space
vim.cmd("set signcolumn=yes")

-- set popup menu maximum rows (specifically for autocompletion menu)
vim.cmd("set pumheight=10")

-- disable the mouse
vim.cmd("set mouse=")

-- move backward and forward through buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", {
	desc = "Move to previous buffer",
})
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", {
	desc = "Move to next buffer",
})

-- PLUGINS
require("config.lazy")
