
local function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

if vim.fn.has('windows') then
    vim.cmd[[
        if has('termguicolors')
          set termguicolors
        endif

        set background=dark
        let g:gruvbox_material_background = 'hard'
        let g:gruvbox_material_better_performance = 1

        colorscheme gruvbox-material
    ]]
else
    require('rose-pine').setup({ disable_background = true
    })
    ColorMyPencils()
end


