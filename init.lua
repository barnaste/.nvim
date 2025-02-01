-- move backward and forward through buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", {
	desc = "Move to previous buffer",
})
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", {
	desc = "Move to next buffer",
})

-- must be set before initializing lazy
vim.g.mapleader = " "

-- PLUGINS
require("config.lazy")

-- CORE KEYBINDS
require("config.options")
require("config.keybinds")
