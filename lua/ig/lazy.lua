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
    { "catppuccin/nvim", name = "catppuccin" },
    --
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
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
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- grep
            { 'BurntSushi/ripgrep' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
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
    'airblade/vim-gitgutter',
    'onsails/lspkind.nvim',
    --'jose-elias-alvarez/null-ls.nvim',
    'akinsho/git-conflict.nvim',
    'tpope/vim-fugitive',
    'github/copilot.vim',
}

local opts = {
    install = {
        missing = true,
    }
}

require('lazy').setup(plugins, opts)
