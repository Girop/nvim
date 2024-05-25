local function should_disable(lang, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
        return true
    end
end

return {
    "nvim-treesitter/nvim-treesitter", 
    config = function()
        local conf_req = require('nvim-treesitter.configs')
        conf_req.setup {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "cpp", "python", "rust", "cmake", "markdown"},
            highlight = {
                enable = true,
                language_tree = true,
                disable = should_disable,
                additional_vim_regex_highlighting = true,
            },    
            sync_install = false,
        }
    end,
}
