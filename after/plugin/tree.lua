vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local function is_nvim_tree()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
        return true
    else
      return false
    end
end

vim.keymap.set("n", "<leader>pv", "<CMD>NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<leader>pb", function ()
    if is_nvim_tree() then
        vim.api.nvim_command("wincmd p")
    else
        vim.api.nvim_command("NvimTreeFocus")
    end
end)

