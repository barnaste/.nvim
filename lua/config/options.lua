local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tab configurations
opt.tabstop = 2
opt.bo.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- don't show mode: useful while lualine is enabled
vim.opt.showmode = false

-- line wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- add signcolumn space
opt.signcolumn = "yes"

-- set popup menu maximum rows (specifically for autocompletion menu)
opt.pumheight = 10

-- disable the mouse
opt.mouse = ""
