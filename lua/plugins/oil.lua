local function configure()
    vim.keymap.set('n', '-', "<CMD>Oil<CR>")
    require("oil").setup()
end


return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  config = configure
}
