-- Set leader key to space
-- vim.g.mapleader = " "
local keymap = vim.keymap

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sq", ":close<CR>") -- close split window
keymap.set("n", "<leader>sj", "<C-w>-")     -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+")     -- make split windows height taller
keymap.set("n", "<leader>s+", "<C-w>>5")    -- make split windows width bigger
keymap.set("n", "<leader>s-", "<C-w><5")    -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>tn", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close a tab
keymap.set("n", "]t", ":tabn<CR>")             -- next tab
keymap.set("n", "[t", ":tabp<CR>")             -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>")   -- put diff from current to other during diff
keymap.set("n", "<leader>ch", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>cl", ":diffget 3<CR>") -- get diff from right (remote) during merg

-- Neotree
vim.keymap.set("n", "<leader>/", ":Neotree filesystem reveal left toggle<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})

-- Completions

-- LSP
-- NOTE: include none-ls keybinds in here also

-- Debug

-- Spider

-- TODO comments
