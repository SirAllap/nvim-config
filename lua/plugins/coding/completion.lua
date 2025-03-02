return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-buffer",   -- Buffer completions
      "hrsh7th/cmp-path",     -- Path completions
      "hrsh7th/cmp-cmdline",  -- Command-line completions
      "L3MON4D3/LuaSnip",     -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippets integration
      "onsails/lspkind.nvim" -- Adds icons to completion
    },
    opts = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      return {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text", -- Show both icons and text
            maxwidth = 50,
            ellipsis_char = "...",
          })
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", keyword_length = 1 },  -- LSP-based auto-completion
          { name = "buffer", keyword_length = 3 },    -- Suggestions from buffer
          { name = "path" },      -- File path suggestions
          { name = "luasnip" },   -- Snippet completions
        }),
        experimental = {
          ghost_text = true, -- Show inline suggestions
        },
      }
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
  -- {
  --   "github/copilot.vim",
  -- }
}
