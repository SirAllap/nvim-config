return {{
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
}, {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {"javascript", "typescript", "json", "html", "css", "python", "astro", "cmake", "cpp",
                            "fish", "gitignore", "go", "graphql", "http", "java", "php", "rust", "scss", "sql", "svelte"},

        query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = {"BufWrite", "CursorHold"}
        },

        playground = {
            enable = true,
            disable = {},
            updatetime = 25,
            persist_queries = true,
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?"
            }
        },

        -- Enable italicized words in syntax highlighting
        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
            -- Define custom captures for specific words like 'export'
            custom_captures = {
                -- Apply italics to the word 'export' in JavaScript or other languages
                ["keyword.export"] = "italic, bold, guifg=#ff6347"  -- Example of italic + bold + color change
            },
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        vim.filetype.add({
            extension = {
                mdx = "mdx"
            }
        })
        vim.treesitter.language.register("markdown", "mdx")
    end
}}
