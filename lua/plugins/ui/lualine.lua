return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "scottmckendry/cyberdream.nvim", -- Optional: for a more colorful theme
      "nvim-tree/nvim-web-devicons",   -- Optional: for file icons support
    },
    opts = {
      options = {
        theme = "cyberdream", -- Use the cyberdream theme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Enable global statusline (Neovim 0.7+)
        disabled_filetypes = { "alpha", "dashboard" }, -- Disable for specific filetypes
      },
      sections = {
        lualine_a = {
          {
            -- Dynamic mode section with color changes
            function()
              local mode_names = {
                n = "NORMAL",
                i = "INSERT",
                v = "VISUAL",
                V = "V-LINE",
                [""] = "V-BLOCK",
                c = "COMMAND",
                s = "SELECT",
                S = "S-LINE",
                [""] = "S-BLOCK",
                R = "REPLACE",
                Rv = "V-REPLACE",
                r = "PROMPT",
                ["!"] = "SHELL",
                t = "TERMINAL",
              }

              -- Get the current mode
              local mode = vim.fn.mode()

              -- Return the mode name
              return mode_names[mode] or "NORMAL"
            end,
            color = function()
              local mode_colors = {
                n = { fg = "#56b6c2" }, -- Normal mode
                i = { fg = "#98c379" }, -- Insert mode
                v = { fg = "#e06c75" }, -- Visual mode
                V = { fg = "#e06c75" }, -- Visual Line mode
                [""] = { fg = "#e06c75" }, -- Visual Block mode
                c = { fg = "#d19a66" }, -- Command mode
                s = { fg = "#c678dd" }, -- Select mode
                S = { fg = "#c678dd" }, -- Select Line mode
                [""] = { fg = "#c678dd" }, -- Select Block mode
                R = { fg = "#e06c75" }, -- Replace mode
                Rv = { fg = "#e06c75" }, -- Virtual Replace mode
                r = { fg = "#e06c75" }, -- Prompt Replace mode
                ["!"] = { fg = "#e06c75" }, -- Shell mode
                t = { fg = "#56b6c2" }, -- Terminal mode
              }

              -- Get the current mode
              local mode = vim.fn.mode()

              -- Return the color for the current mode
              return mode_colors[mode] or { fg = "#56b6c2" } -- Default to Normal mode color
            end,
          },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
          {
            -- Custom filesize function
            function()
              local filename = vim.fn.expand("%:p")
              if filename == "" then return "" end
              local size = vim.fn.getfsize(filename)
              if size < 0 then return "" end
              local suffixes = { "B", "KB", "MB", "GB" }
              local i = 1
              while size > 1024 and i < #suffixes do
                size = size / 1024
                i = i + 1
              end
              return string.format("%.1f%s", size, suffixes[i])
            end,
            color = { fg = "#ff9e64" }, -- Customize file size color
          },
          {
            -- Custom clock function
            function()
              return vim.fn.winwidth(0) > 80 and os.date("%H:%M:%S") or ""
            end,
            color = { fg = "#56b6c2" }, -- Customize clock color
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive", "nvim-tree" }, -- Add extensions if needed
    },
  },
}
