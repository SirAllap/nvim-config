local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

-- Clone lazy.nvim if not already installed
if not uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { result, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and LazyVim
require("lazy").setup({
  spec = {
    -- 1. LazyVim core plugins (must come first)
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {},
    },

    -- 2. LazyVim extras (optional)
    { import = "lazyvim.plugins.extras.coding.neogen" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.formatting.black" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.sql" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- 3. Custom plugins (your own plugins)
    { import = "plugins.dashboard" }, -- Your custom dashboard
    { import = "plugins" }, -- Other custom plugins

    -- 4. Additional plugins (non-LazyVim plugins)
    {
      "folke/tokyonight.nvim",
      priority = 1000, -- Ensure this loads first
      init = function()
        vim.cmd.colorscheme("tokyonight")
      end,
      config = function()
        require("tokyonight").setup({
          style = "storm",
          transparent = true,
          styles = {
            sidebars = "transparent",
            floats = "transparent",
          },
        })
      end,
    },
    {
      "folke/twilight.nvim",
      opts = {},
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({
          defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
              i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
              },
            },
          },
        })
      end,
    },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("toggleterm").setup({
          size = function(term)
            if term.direction == "horizontal" then
              return 15
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.4
            end
          end,
          open_mapping = [[<c-\>]],
        })
      end,
    },
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<C-e>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
          },
          ignore_filetypes = { "cpp" },
          color = {
            suggestion_color = "#ff69b4",
            cterm = 205,
          },
        })
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  install = {
    colorscheme = { "tokyonight" }, -- Ensure installation
  },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})
