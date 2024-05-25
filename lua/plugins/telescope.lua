local function configure() 
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    vim.keymap.set('n', "<leader>ff", builtin.find_files)
    vim.keymap.set('n', "<leader>fs", builtin.live_grep)

    telescope.setup {    
        pickers = {
            find_files = {
                hidden = false,
                file_ignore_patterns = {
                    ".git/.*",
                    "build/.*",
                }
            }
        },
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
            }
        }
    }
end


return {
	"nvim-telescope/telescope.nvim",  
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        'sharkdp/fd'
    },
    config = configure,
}
