vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>dd", "\"_dd")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>p", "\"_dP")

vim.keymap.set("n", "sv", "<cmd>vs<cr>")
vim.keymap.set("n", "sh", "<C-w>s")
vim.keymap.set("n", "sq", "<C-w><C-q>")

vim.keymap.set('n', "<leader><s-k>", "<cmd>vertical resize +15<cr>")
vim.keymap.set('n', "<leader><s-j>", "<cmd>vertical resize -15<cr>")

vim.keymap.set('n', '<M-j>', 'yyp')
vim.keymap.set('n', '<M-k>', 'yyP')

vim.keymap.set('n', '<leader><leader>', "<cmd>e #<cr>")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
