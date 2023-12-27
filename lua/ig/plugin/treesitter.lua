require("nvim-treesitter").setup {
    highlight = {
        enable = true,
        language_tree = true,
        is_supported = function ()
            if vim.fn.strwidth(vim.fn.getline('.')) > 300 or vim.fn.getfsize(vim.fn.expand('%')) > 1024 * 1024 then
                print("File to large!")
                return false
            else
                return true
            end
        end
    }
}
