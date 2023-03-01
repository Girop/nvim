vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")

vim.keymap.set('n', "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n","<leader>p", "\"_dP")

vim.keymap.set("i", "<C-Del>", "<C-o>dw")

vim.keymap.set("n","<leader>v","<cmd>vs<cr>")
vim.keymap.set("n","<leader>q","<C-w><C-q>")

vim.keymap.set('n',"<leader><s-k>","<cmd>vertical resize +10<cr>")
vim.keymap.set('n',"<leader><s-j>","<cmd>vertical resize -10<cr>")

