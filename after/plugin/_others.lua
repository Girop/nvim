-- requires
require('nvim_comment').setup()
require('git-conflict').setup()
require("nvim-web-devicons").setup{
    color_icons = true,
    default = true,
}

-- Keymaps
vim.keymap.set("n", "<leader>clr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Blamer
vim.cmd("let g:blamer_enabled = 1")
vim.cmd("let g:blamer_relative_time = 1")
vim.cmd("let g:blamer_delay = 100")
