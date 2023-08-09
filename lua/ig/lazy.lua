local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- themes
    'sainnhe/gruvbox-material',
    'catppuccin/nvim',
    --

    'nvim-lua/plenary.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    'mbbill/undotree',
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },
            -- grep
            { 'BurntSushi/ripgrep' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    }, 

    "jiangmiao/auto-pairs",
    "terrortylor/nvim-comment",
    "akinsho/toggleterm.nvim",
    "folke/lsp-colors.nvim",
    "folke/trouble.nvim",
    'APZelos/blamer.nvim',
    'airblade/vim-gitgutter',
    'onsails/lspkind.nvim',
    'lervag/vimtex',
    {'akinsho/git-conflict.nvim', version = "*", config = true},
    'tpope/vim-fugitive',
    "Pocco81/auto-save.nvim",
}

local opts = {
    install = {
        missing = true,
    }
}
require('lazy').setup(plugins, opts)
