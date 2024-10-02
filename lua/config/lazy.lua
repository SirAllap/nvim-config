local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

-- Clone lazy.nvim if not already installed
if not uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local result = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {result, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and LazyVim
require("lazy").setup({
    spec = { -- LazyVim core and plugins
    {
        "LazyVim/LazyVim",
        import = "lazyvim.plugins",
        opts = {
            colorscheme = "rose-pine"
        }
    }, -- Additional LazyVim plugins
    {
        import = "lazyvim.plugins.extras.coding.neogen"
    }, {
        import = "lazyvim.plugins.extras.linting.eslint"
    }, {
        import = "lazyvim.plugins.extras.formatting.prettier"
    }, {
        import = "lazyvim.plugins.extras.formatting.black"
    }, {
        import = "lazyvim.plugins.extras.lang.typescript"
    }, {
        import = "lazyvim.plugins.extras.lang.tailwind"
    }, {
        import = "lazyvim.plugins.extras.lang.sql"
    }, {
        import = "lazyvim.plugins.extras.lang.python"
    }, {
        import = "lazyvim.plugins.extras.lang.json"
    }, {
        import = "lazyvim.plugins.extras.lang.docker"
    }, -- Custom plugin imports
    {
        import = "plugins"
    }, -- Twilight plugin with default settings
    {
        "folke/twilight.nvim",
        opts = {} -- Use default settings
    }, -- Telescope plugin
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {"nvim-lua/plenary.nvim"}
    }, -- Toggleterm plugin
    {
        "akinsho/toggleterm.nvim",
        version = "*", -- Use specific version if needed
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<c-\>]] -- Keybinding to toggle terminal
            })
        end
    }, -- Supermaven plugin
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-e>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>"
                },
                ignore_filetypes = {"cpp"},
                color = {
                    suggestion_color = "#ff69b4", -- Pinkish color (Hot Pink)
                    cterm = 205 -- Terminal color for pinkish hue
                },
                log_level = "info",
                disable_inline_completion = false,
                disable_keymaps = false,
                condition = function()
                    return false
                end
            })
        end
    }},
    defaults = {
        lazy = false, -- Lazy-load only LazyVim plugins by default
        version = false -- Use the latest git commit
    },
    checker = {
        enabled = true, -- Periodically check for plugin updates
        notify = false
    },
    performance = {
        rtp = {
            disabled_plugins = {"gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin"}
        }
    }
})

-- Automatically enable Twilight in all buffers
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "TwilightEnable"
})
