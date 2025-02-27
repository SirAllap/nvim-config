require("config.lazy")

-- Enable clipboard support
vim.opt.clipboard:append("unnamedplus")

-- Optional: For Neovide (if you use it)
vim.g.neovide_input_use_logo = 1

-- Enable syntax highlighting and true colors
vim.cmd("syntax enable")
vim.cmd("set termguicolors")

-- Enable italicized comments or other syntax elements
vim.cmd([[ highlight Comment cterm=italic gui=italic ]])
vim.cmd([[ highlight Keyword cterm=italic gui=italic ]])
