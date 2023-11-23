require('nvim_comment').setup()
require("nvim-web-devicons").setup {
    color_icons = true,
    default = true,
}


vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

require("mason").setup()
