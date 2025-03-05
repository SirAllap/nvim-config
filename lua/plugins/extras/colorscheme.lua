return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Set light or dark variant
        variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

        -- Enable transparent background
        transparent = true,

        -- Reduce the overall saturation of colours for a more muted look
        saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

        -- Enable italics comments
        italic_comments = false,

        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = false,

        -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
        borderless_pickers = false,

        -- Set terminal colors used in `:terminal`
        terminal_colors = true,

        -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
        cache = false,

        -- Override highlight groups with your own colour values
        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

          -- Example:
          Comment = { fg = "#696969", bg = "NONE", italic = true },

          -- More examples can be found in `lua/cyberdream/extensions/*.lua`
        },

        -- Override a highlight group entirely using the built-in colour palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            Normal         = { bg = colors.bg, fg = colors.fg },
            Comment        = { fg = colors.green, bg = nil, italic = true },
            ["@property"]  = { fg = colors.magenta, bold = true },
            Visual         = { bg = "#333333" },
            StatusLine     = { bg = colors.blue, fg = colors.fg, bold = true },
            VertSplit      = { bg = colors.bg, fg = colors.blue },
            Pmenu          = { bg = "#2b2b2b", fg = colors.fg },
            ErrorMsg       = { fg = colors.red, bg = colors.bg, bold = true },
            WarningMsg     = { fg = colors.yellow, bg = colors.bg },
          }
        end,

        -- Override a color entirely
        colors = {
          bg      = "#1e1e2e",    -- Set the background to #1e1e2e
          fg      = "#cdd6f4",    -- Soft foreground for readability
          green   = "#a6e3a1",    -- Pleasant green for comments and hints
          magenta = "#f5c2e7",    -- Soft magenta for properties and highlights
          blue    = "#89b4fa",    -- Calm blue for UI elements and borders
          red     = "#f38ba8",    -- Soft red for errors
          yellow  = "#fab387",    -- Warm yellow for warnings
          orange  = "#f9ae58",    -- Soft orange for warnings
          pink    = "#f38ba8",    -- Soft pink for errors
          purple  = "#89b4fa",    -- Calm purple for UI elements and borders
          violet  = "#a6e3a1",    -- Pleasant violet for comments and hints
          cyan    = "#89b4fa",    -- Calm cyan for UI elements and borders
          teal    = "#a6e3a1",    -- Pleasant teal for comments and hints
          black   = "#1e1e2e",    -- Set the background to #1e1e2e
          white   = "#cdd6f4",    -- Soft white for readability
          gray    = "#cdd6f4",    -- Soft gray for readability
          graydark = "#cdd6f4",    -- Soft gray for readability
          graylight = "#cdd6f4",    -- Soft gray for readability
          reddark = "#f38ba8",    -- Soft red for errors
          greendark = "#a6e3a1",    -- Pleasant green for comments and hints
          yellowdark = "#fab387",    -- Warm yellow for warnings
          orangedark = "#f9ae58",    -- Soft orange for warnings
          pinkdark = "#f38ba8",    -- Soft pink for errors
          purpledark = "#89b4fa",    -- Calm purple for UI elements and borders
        },

        -- Disable or enable colorscheme extensions
        extensions = {
          telescope = true,
          notify = true,
          mini = true,
          -- ... other extensions
        },
      })

      -- Set the colorscheme
      vim.cmd("colorscheme cyberdream")
    end,
  }
}
