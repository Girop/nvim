vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    --themes 
    use('fcpg/vim-fahrenheit')
    use("ellisonleao/gruvbox.nvim")
    use("fcpg/vim-farout")
    --

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('mbbill/undotree') -- undo branched history
  use('tpope/vim-fugitive') -- git support
  use {
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
      }
  }
  use('eandrju/cellular-automaton.nvim') -- visual supraise
  use('jiangmiao/auto-pairs') -- bracket autocompletion
  use("Pocco81/auto-save.nvim")
  use {
      "folke/which-key.nvim",
      config = function ()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup()
      end
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use('nvim-lualine/lualine.nvim')
  use {
      "terrortylor/nvim-comment",
      config = function ()
        require("nvim_comment").setup()
      end
  }
  use {
      "akinsho/toggleterm.nvim",
      tag = "*",
  }
  use {
      "nvim-tree/nvim-tree.lua",
      requires = {
          "nvim-tree/nvim-web-devicons"
      }
  }
  use("nvim-tree/nvim-web-devicons")
  use{
      "CRAG666/code_runner.nvim",
      requires = 'nvim-lua/plenary.nvim'
  }

  use('folke/lsp-colors.nvim')
  use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
          require("trouble").setup{}
      end
  }
  use('APZelos/blamer.nvim')
  use {'jose-elias-alvarez/null-ls.nvim'}
end)
