local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  }
}

