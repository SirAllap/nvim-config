-- lua/plugins/mason.lua
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black", "pyright", "ruff", "debugpy", "eslint_d",
        "prettierd", "typescript-language-server", "biome"
      })
    end
  }
}

