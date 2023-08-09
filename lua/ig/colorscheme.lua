local catppuccin = require("catppuccin")

catppuccin.setup({
    transparent_background = true,
    comments = { "italic" },
    conditionals = { "italic" },
    integrations = {
        ts_rainbow = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
    },
    color_overrides = {
        mocha = {
            text = "#F4CDE9",
            subtext1 = "#DEBAD4",
            subtext0 = "#C8A6BE",
            overlay2 = "#B293A8",
            overlay1 = "#9C7F92",
            overlay0 = "#866C7D",
            surface2 = "#705867",
            surface1 = "#5A4551",
            surface0 = "#44313B",

            base = "#5c0717",
            mantle = "#211924",
            crust = "#1a1016",
        },
    },
})

vim.cmd.colorscheme "catppuccin"

-- vim.cmd[[
--     set background=dark
--     let g:gruvbox_material_foreground = 'material'
--     let g:gruvbox_material_background = 'medium'
-- ]]
-- vim.cmd.colorscheme "gruvbox-material"
