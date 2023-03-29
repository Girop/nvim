require('nvim-treesitter.configs').setup{
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "help",
        "query",
        "python",
        "go"
    },
    auto_install = true,
    highlight = {
        enable = true
    },
    additional_vim_regex_highlighting = false,
}
