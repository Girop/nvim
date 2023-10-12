require('nvim_comment').setup()
require("nvim-web-devicons").setup {
    color_icons = true,
    default = true,
}

vim.cmd("let g:blamer_enabled = 1")
vim.cmd("let g:blamer_relative_time = 1")
vim.cmd("let g:blamer_delay = 100")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

require("mason").setup()
