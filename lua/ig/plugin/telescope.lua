local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["<M-j>"] = actions.move_selection_next,
                ["<M-k>"] = actions.move_selection_previous,
                ["<Tab>"] = actions.select_default,
            },
            i = {
                ["<M-j>"] = actions.move_selection_next,
                ["<M-k>"] = actions.move_selection_previous,
                ["<Tab>"] = actions.select_default,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = {
                "%.git/.*",
                "build/.*",
            }
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fs', builtin.live_grep)
