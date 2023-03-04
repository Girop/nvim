local wk = require("which-key")
wk.setup()
wk.register(mappings, opts)

vim.o.timeout = true
vim.o.timeoutlen = 300
