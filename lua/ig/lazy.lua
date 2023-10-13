local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'sainnhe/gruvbox-material',
    'nvim-treesitter/nvim-treesitter',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'},
    },
    'nvim-lualine/lualine.nvim',
    'christoomey/vim-tmux-navigator',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
        },
    },
    'terrortylor/nvim-comment',
    'mbbill/undotree',
    'tpope/vim-sensible',
    'cohama/lexima.vim',
    'APZelos/blamer.nvim',
    'airblade/vim-gitgutter',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
        }
      },
    'onsails/lspkind.nvim',
    -- Git conflict support
}


-- {
    --'VonHeikemen/lsp-zero.nvim',
   -- dependencies = {
    -- LSP Support
   -- { 'neovim/nvim-lspconfig' },   
   -- { 'williamboman/mason.nvim' },
    --{ 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
   -- { 'hrsh7th/nvim-cmp'},
   -- { 'hrsh7th/cmp-nvim-lsp'},
   -- { 'hrsh7th/cmp-buffer' },
   -- { 'hrsh7th/cmp-path' },
    --{ 'hrsh7th/cmp-nvim-lua' },
   -- { 'saadparwaiz1/cmp_luasnip' },
    -- },
    -- },
    -- 'folke/lsp-colors.nvim',
    -- 'folke/trouble.nvim',
    -- 'tpope/vim-fugitive',
-- }

local opts = {
    install = {
        missing = true,
    }
}

require('lazy').setup(plugins, opts)
