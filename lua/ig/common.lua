vim.cmd.colorscheme "fahrenheit"

-- Keymaps --
vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv") vim.keymap.set('n', "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>v", "<cmd>vs<cr>")
vim.keymap.set("n", "<leader>q", "<C-w><C-q>")

vim.keymap.set('n', "<leader><s-k>", "<cmd>vertical resize +10<cr>")
vim.keymap.set('n', "<leader><s-j>", "<cmd>vertical resize -10<cr>")

vim.keymap.set('n', '<M-j>', 'yyp')
vim.keymap.set('n', '<M-k>', 'yyP')

vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('n', '<leader><leader>', "<cmd>e #<cr>")


-- Sets and others --
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = false
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.cmd[[set clipboard+=unnamedplus]]
vim.opt.cursorline = true
vim.o.pumheight = 15

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})


-- Highlight for search commands
local hl_ns = vim.api.nvim_create_namespace('search')
local hlsearch_group = vim.api.nvim_create_augroup('hlsearch_group', { clear = true })

local function manage_hlsearch(char)
  local key = vim.fn.keytrans(char)
  local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }

  if vim.fn.mode() == 'n' then
    if not vim.tbl_contains(keys, key) then
      vim.cmd([[ :set nohlsearch ]])
    elseif vim.tbl_contains(keys, key) then
      vim.cmd([[ :set hlsearch ]])
    end
  end

  vim.on_key(nil, hl_ns)
end

vim.api.nvim_create_autocmd('CursorMoved', {
  group = hlsearch_group,
  callback = function()
    vim.on_key(manage_hlsearch, hl_ns)
  end,
})
