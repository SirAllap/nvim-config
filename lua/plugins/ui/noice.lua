return {
  -- messages, cmdline, and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available"
        },
        opts = {
          skip = true
        }
      })
      local focused = true
      vim.api.nvim_create_autocmd({ "FocusGained", "FocusLost" }, {
        callback = function(event)
          focused = (event.event == "FocusGained")
        end
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end
        },
        view = "notify_send",
        opts = {
          stop = false
        }
      })

      opts.commands = {
        all = {
          view = "split",
          opts = {
            enter = true,
            format = "details"
          },
          filter = {}
        }
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end
      })

      opts.presets.lsp_doc_border = true
    end
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      render = "wrapped-compact",
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end
    }
  },
  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false
      }
    end
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" }
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
        diagnostics = "nvim_lsp"
      }
    }
  },
  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "scottmckendry/cyberdream.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta, guifg = colors.bg_dark },
            InclineNormalNC = { guifg = colors.magenta, guibg = colors.bg }
          }
        },
        window = {
          margin = { vertical = 0, horizontal = 1 }
        },
        hide = {
          cursorline = true
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return {
            { icon, guifg = color },
            { " " },
            { filename }
          }
        end
      })
    end
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c = {
        { LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 "
        }) }
      }
      opts.options = {
        component_separators = "|",
        section_separators = { left = "", right = "" }
      }
    end
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" }
      }
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" }
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    opts = {
      indent = { char = "▏" },
      scope = {
        show_start = false,
        show_end = false,
        include = {
          node_type = { ["*"] = { "*" } }
        }
      }
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        plugins = {
          spelling = { enabled = true, suggestions = 20 },
          presets = { operators = false, motions = false }
        },
        window = {
          win = {
            border = "rounded",
            margin = { 1, 1, 1, 1 },
            winblend = 10,
            zindex = 999
          },
          layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 }
          }
        },
        ignore_missing = true
      })

      -- Modern group registration
      require("which-key").register({
        ["<leader>"] = {
          c = { show_with_group = "code" },
          d = { show_with_group = "debug" },
          f = { show_with_group = "file" },
          g = { show_with_group = "git" },
          s = { show_with_group = "search" },
          w = { show_with_group = "windows" },
        }
      })
    end
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        relative = "editor",
        border = "rounded",
        prefer_width = 0.4,
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end
      },
      select = {
        backend = { "telescope", "builtin" },
        trim_prompt = true,
        builtin = {
          border = "rounded",
          relative = "editor"
        }
      }
    }
  }
}
