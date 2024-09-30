return {{
    "folke/twilight.nvim",
    lazy = false,
    opts = {
        dimming = {
            alpha = 0.25,
            color = {"Normal", "#cccccc"},
            inactive = false
        },
        context = 15,
        treesitter = true,
        expand = {"function", "method", "class", "if_statement", "table"},
        exclude = {"dashboard", "alpha"},
        highlight = {
            "Visual",
            blend = 20
        }
    },
    config = function(_, opts)
        require("twilight").setup(opts)
    end
}}
