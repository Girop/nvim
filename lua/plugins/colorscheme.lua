local function confgure()
    vim.cmd [[
        set background=dark
        let g:python_highlight_all = 1
        let g:gruvbox_contrast_dark = 'hard'
        let g:gruvbox_italic = 1
        let g:gruvbox_improved_warnings = 1

        colorscheme fahrenheit
    ]]
end

return {
    {
        'morhetz/gruvbox',
    },
    {'fcpg/vim-fahrenheit',
    config = confgure
    },
    {'fcpg/vim-farout'},
}
