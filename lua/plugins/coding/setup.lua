return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      tsserver = function(_, opts)
        local ts = require("typescript")
        ts.setup({ server = opts })

        require("lazyvim.util").lsp.on_attach(function(client, bufnr)
          if client.name == "tsserver" then
            local opts = { buffer = bufnr, silent = true }

            -- Organize imports on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
              end,
            })

            -- Keymaps for organizing imports & renaming files
            vim.keymap.set("n", "<leader>co", ts.actions.organizeImports, opts)
            vim.keymap.set("n", "<leader>cR", ts.actions.renameFile, opts)
          end
        end)
        return true
      end
    }
  }
}
