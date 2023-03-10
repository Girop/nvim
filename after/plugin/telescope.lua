local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
    defaults = {
        mappings = {
            n = {
                ["<M-j>"] = actions.move_selection_next,
                ["<M-k>"] = actions.move_selection_previous,
            },
            i = {
                ["<M-j>"] = actions.move_selection_next,
                ["<M-k>"] = actions.move_selection_previous,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n','<leader>ff',builtin.find_files)
vim.keymap.set('n','<leader>fs', builtin.live_grep)
vim.keymap.set('n','<leader>fb', builtin.buffers)
vim.keymap.set('n','<leader>fh', builtin.help_tags)
vim.keymap.set('n','<leader>hh', builtin.search_history)
vim.keymap.set('n','<leader>clr', builtin.colorscheme)
