local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    'wbthomason/packer.nvim',
    'fcpg/vim-fahrenheit',
    "ellisonleao/gruvbox.nvim",
    "fcpg/vim-farout",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    },
    'mbbill/undotree',
    'nvim-treesitter/nvim-treesitter',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        },

        'eandrju/cellular-automaton.nvim',
        "jiangmiao/auto-pairs",
        "Pocco81/auto-save.nvim",

        {
            "folke/which-key.nvim",
            config = function ()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup()
            end
        },
    },
    {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    },
    'nvim-lualine/lualine.nvim',
    {
        "terrortylor/nvim-comment",
        config = function ()
            require("nvim_comment").setup()
        end
    },
    {
        "akinsho/toggleterm.nvim",
        tag = "*",
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
        'folke/lsp-colors.nvim',
    {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup{}
        end
    },
    'APZelos/blamer.nvim',
    {'jose-elias-alvarez/null-ls.nvim'},
    'airblade/vim-gitgutter',
})

