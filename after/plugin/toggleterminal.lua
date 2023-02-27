require("toggleterm").setup{
    autochdir = true,
    start_in_insert = true,
    direction = "vertical",
    auto_scroll = true,
}

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm size=40<cr>")
