local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- themes
    'fcpg/vim-fahrenheit',
    'artanikin/vim-synthwave84',
    'sainnhe/gruvbox-material',
    'Mofiqul/dracula.nvim',
    -- 
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    'mbbill/undotree',
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},
            -- grep
            {'BurntSushi/ripgrep'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
    },
        'eandrju/cellular-automaton.nvim',
        "jiangmiao/auto-pairs",
        "Pocco81/auto-save.nvim",
        "folke/which-key.nvim",
    'nvim-lualine/lualine.nvim',
    "terrortylor/nvim-comment",
    "akinsho/toggleterm.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "folke/lsp-colors.nvim",
    "folke/trouble.nvim",
    'APZelos/blamer.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'airblade/vim-gitgutter',
    'nvim-tree/nvim-tree.lua',
    'onsails/lspkind.nvim',
}

local opts  ={
    install = {
        missing = true,
    }
}

require('lazy').setup(plugins,opts)

vim.o.background = 'dark'
vim.cmd[[let g:gruvbox_material_better_performance = 1]]
vim.cmd[[let g:gruvbox_material_foreground = 'original']]
vim.cmd[[let g:gruvbox_material_background = 'soft']]
vim.cmd[[colorscheme gruvbox-material]]
