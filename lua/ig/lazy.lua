local plugins = {
    -- themes
    'fcpg/vim-fahrenheit',

    -- 
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    'mbbill/undotree',
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
            -- grep
            {'BurntSushi/ripgrep'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        },
    },
        'eandrju/cellular-automaton.nvim',
        "jiangmiao/auto-pairs",
        "Pocco81/auto-save.nvim",
        "folke/which-key.nvim",
    'nvim-lualine/lualine.nvim',
    "terrortylor/nvim-comment",
    {
        "akinsho/toggleterm.nvim",
        tag = "*",
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "folke/lsp-colors.nvim",
    "folke/trouble.nvim",
    'APZelos/blamer.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'airblade/vim-gitgutter',
    'psliwka/vim-smoothie',
}

local opts  ={
    install = {
        missing = true,
    }
}

require('lazy').setup(plugins,opts)
