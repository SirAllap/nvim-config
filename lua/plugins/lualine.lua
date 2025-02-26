return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      -- "folke/tokyonight.nvim", -- Ensure tokyonight is a dependency
      "scottmckendry/cyberdream.nvim", -- Optional: for a more colorful theme
      "nvim-tree/nvim-web-devicons" -- Optional: for file icons support
    },
    opts = (function()
      -- Custom function to display current clock time
      local function clock()
        -- Only display the clock if the window is wide enough
        if vim.fn.winwidth(0) > 80 then
          return os.date("%H:%M:%S")
        else
          return ""
        end
      end

      -- Custom function to display the file size in human-readable format
      local function filesize()
        local filename = vim.fn.expand('%:p')
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
      end

      return {
        options = {
          theme = "cyberdream", -- Use the cyberdream theme
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true, -- Enable a global statusline (Neovim 0.7+)
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
            filesize,  -- Display file size
            clock,     -- Display clock time
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
        extensions = {},
      }
    end)(),
  },
}
