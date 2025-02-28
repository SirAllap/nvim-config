-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- General Editor Settings
vim.opt.wrap = true                     -- Enable line wrapping
vim.opt.number = true                    -- Show line numbers
vim.opt.relativenumber = true            -- Show relative line numbers
vim.opt.cursorline = true                -- Highlight the current line
vim.opt.confirm = true                   -- Ask for confirmation instead of erroring
vim.opt.conceallevel = 2                 -- Conceal certain syntax elements (e.g., markdown bold/italic)
vim.opt.spelloptions = "camel"           -- Treat camelCase as separate words for spell checking

-- Scrolling and Mouse
vim.opt.scrolloff = 8                    -- Minimum number of lines to keep above/below the cursor
vim.opt.sidescrolloff = 8                -- Minimum number of columns to keep at the sides of the cursor
vim.opt.mouse = "a"                      -- Enable mouse support in all modes

-- Indentation and Tabs
vim.opt.tabstop = 4                      -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4                   -- Number of spaces to use for autoindent
vim.opt.expandtab = true                 -- Use spaces instead of tabs
vim.opt.smartindent = true               -- Enable smart indentation

-- Clipboard Support
vim.opt.clipboard:append("unnamedplus")  -- Sync with system clipboard

-- Undo and Persistence
vim.opt.undofile = true                  -- Enable persistent undo

-- Syntax Highlighting and Colors
vim.cmd("syntax enable")                 -- Enable syntax highlighting
vim.cmd("set termguicolors")             -- Enable true color support

-- Italicized Comments and Keywords
vim.cmd([[ highlight Comment cterm=italic gui=italic ]])  -- Italicize comments
vim.cmd([[ highlight Keyword cterm=italic gui=italic ]])  -- Italicize keywords

-- Language-Specific Settings
-- Python LSP and Ruff Configuration
vim.g.lazyvim_python_lsp = "pyright"     -- Use pyright as the Python LSP
vim.g.lazyvim_python_ruff = "ruff"       -- Use ruff for Python linting

-- Neovide-Specific Settings (optional)
vim.g.neovide_input_use_logo = 1         -- Enable the Super (Windows/Logo) key in Neovide
