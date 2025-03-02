return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")
    return {
      sources = {
        null_ls.builtins.formatting.prettierd, -- JS formatting
        null_ls.builtins.code_actions.eslint_d, -- ESLint auto-fixes
        null_ls.builtins.formatting.black, -- Python formatting
        null_ls.builtins.formatting.ruff,  -- Python linting
      },
    }
  end,
}

