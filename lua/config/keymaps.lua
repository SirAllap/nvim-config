-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Improved window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Better buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Disable arrow keys
vim.keymap.set("n", "<Left>", "<NOP>", { silent = true })
vim.keymap.set("n", "<Right>", "<NOP>", { silent = true })
vim.keymap.set("n", "<Up>", "<NOP>", { silent = true })
vim.keymap.set("n", "<Down>", "<NOP>", { silent = true })

-- Double jj
vim.keymap.set("i", "jj", "<ESC>")

