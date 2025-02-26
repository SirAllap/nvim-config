return {
  "folke/twilight.nvim",
  lazy = false, -- Load the plugin immediately

  opts = {
    -- Dimming configuration for non-focused code blocks
    dimming = {
      alpha = 0.5,                        -- Transparency level (0.0 is opaque, 1.0 is fully dimmed)
      color = { "Normal", "#3c3c3c" },      -- Fallback color for the dim effect
      inactive = false,                   -- Keep dimming enabled for all windows
    },

    -- Number of context lines visible around the focused code block
    context = 15,

    -- Enable Treesitter integration for improved syntax awareness
    treesitter = true,

    -- Syntax nodes to expand for more context beyond the immediate selection
    expand = { "function", "method", "class", "if_statement", "table" },

    -- Filetypes to exclude from Twilight's dimming effect
    exclude = { "dashboard", "alpha" },

    -- Highlight configuration for the focused area
    highlight = {
      "Visual",  -- Highlight group to use for focused text
      blend = 20 -- Blending factor for the highlight (lower values mean more opacity)
    },

    -- Optional callback functions for notifications
    on_open = function()
      vim.notify("Twilight mode enabled", vim.log.levels.INFO)
    end,
    on_close = function()
      vim.notify("Twilight mode disabled", vim.log.levels.INFO)
    end,
  },

  config = function(_, opts)
    local twilight = require("twilight")
    twilight.setup(opts)

    -- Create a user command to toggle Twilight mode
    vim.api.nvim_create_user_command("TwilightToggle", function()
      twilight.toggle()
    end, { desc = "Toggle Twilight mode" })

    -- Map <leader>tw to quickly toggle Twilight mode in normal mode
    vim.keymap.set("n", "<leader>tw", twilight.toggle, { desc = "Toggle Twilight" })

    -- Automatically enable Twilight on VimEnter, ensuring UI is ready
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        twilight.toggle()
      end,
      once = true,
    })
  end,
}
