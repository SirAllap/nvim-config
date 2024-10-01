-- config/user/toggleterm.lua
return {{
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                else
                    return 20 -- Default size for other directions
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true, -- Hide terminal line numbers
            shade_terminals = true, -- Enable shading of terminal buffers
            start_in_insert = true -- Start in insert mode
        })
    end
}}
