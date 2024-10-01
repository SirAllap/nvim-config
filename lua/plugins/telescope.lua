return {{
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = "> ",
                selection_caret = "> ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8
                    },
                    vertical = {
                        mirror = false
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120
                },
                file_sorter = telescope.sorters.get_fuzzy_file,
                file_ignore_patterns = {},
                generic_sorter = telescope.sorters.get_generic_fuzzy_sorter,
                path_display = {"absolute"},
                winblend = 0,
                border = {},
                borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
                color_devicons = true,
                use_less = true,
                set_env = {
                    ["COLORTERM"] = "truecolor"
                }
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                    previewer = false,
                    hidden = true
                },
                buffers = {
                    theme = "dropdown",
                    previewer = false
                },
                help_tags = {
                    theme = "dropdown"
                }
            },
            extensions = {
                -- Define your extensions here if any
            }
        })

        local function open_projects()
            telescope.builtin.find_files({
                prompt_title = "Projects",
                cwd = "/mnt/data/code"
            })
        end

        vim.api.nvim_set_keymap("n", "<leader>p", ":lua open_projects()<CR>", {
            noremap = true,
            silent = true
        })
    end
}}
