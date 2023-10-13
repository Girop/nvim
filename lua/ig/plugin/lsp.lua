local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  preselect = 'item',
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<M-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<M-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
    ['<C-s>'] = cmp.mapping.complete(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    documentation = {
      max_height = 15,
      max_width = 60,
    }
  },
  formatting = {
    fields = {'abbr', 'menu', 'kind'},
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
})

local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
}
