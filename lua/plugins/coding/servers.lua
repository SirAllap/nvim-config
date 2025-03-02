return {
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
                reportUnknownVariableType = "none",
                reportUnknownMemberType = "none",
                reportMissingTypeStubs = "none",
              },
            }
          }
        }
      },
      tsserver = {
        settings = {
          completions = { completeFunctionCalls = true }
        }
      }
    }
  }
}
