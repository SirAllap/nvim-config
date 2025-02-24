-- lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black", "pyright", "ruff", "debugpy", "eslint_d",
        "prettierd", "typescript-language-server", "biome"
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                diagnosticSeverityOverrides = {
                reportUnknownVariableType = "none", -- Disable this specific warning
                reportUnknownMemberType = "none",   -- Disable other type-related warnings
                reportMissingTypeStubs = "none",    -- Disable missing type stubs warnings
              },
              }
            }
          }
        },
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = true
            }
          }
        }
      },
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.name == "tsserver" then
              vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>",
                { buffer = buffer, desc = "Organize Imports" })
              vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>",
                { desc = "Rename File", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end
      }
    }
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = { enable = false },
        lightbulb = { enable = false },
        outline = { keys = { toggle_or_jump = '<leader>cs' } },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")
    return {
      sources = {
        null_ls.builtins.formatting.black, -- Python formatting
        null_ls.builtins.formatting.ruff,  -- Python linting and formatting
      },
    }
  end,
  }
}
