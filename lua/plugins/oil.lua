local function configure()
    vim.keymap.set('n', '-', "<CMD>Oil<CR>")
    require("oil").setup{
    view_options = {
        show_hidden = true
    }}
end

return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  config = configure
}
