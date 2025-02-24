-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local augroup = vim.api.nvim_create_augroup("MyAutoCmds", { clear = true })

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd("silent! %s/\\s\\+$//e")
  end,
})

