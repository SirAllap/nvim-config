return {
    -- Mason and other tools setup
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "stylua", "selene", "luacheck", "shellcheck", "shfmt", "tailwindcss-language-server",
                "typescript-language-server", "css-lsp"
            })
        end
    },

    -- LSP Servers Setup
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            servers = {
                cssls = {},
                tailwindcss = { root_dir = require("lspconfig.util").root_pattern(".git") },
                tsserver = {
                    root_dir = require("lspconfig.util").root_pattern(".git"),
                    single_file_support = false,
                    settings = {
                        typescript = {
                            inlayHints = { includeInlayParameterNameHints = "literal" }
                        },
                        javascript = {
                            inlayHints = { includeInlayParameterNameHints = "all" }
                        }
                    }
                },
            },
            setup = {}
        }
    },

    -- Setup Prettier with null-ls for formatting
    {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = { "javascript", "javascriptreact", "typescriptreact", "json", "css", "scss", "html" }
                    }),
                },
            })

            -- Auto-format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    },

    -- Additional LSP config (for keymaps and etc.)
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            vim.list_extend(keys, {
                {
                    "gd",
                    function()
                        require("telescope.builtin").lsp_definitions({ reuse_win = false })
                    end,
                    desc = "Goto Definition",
                    has = "definition"
                }
            })
        end
    },

    -- Keybinding for manual formatting (Ctrl + S)
    {
        config = function()
            -- Manually trigger formatting on Ctrl + S
            vim.api.nvim_set_keymap("n", "<C-s>", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
        end
    }
}
