local function run_scripts_picker(telescope_scripts)
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    pickers.new({}, {
        prompt_title = "Scripts",
        finder = finders.new_table({
            results = telescope_scripts,
            entry_maker = function(script)
                return {
                    value = script,
                    display = script,
                    ordinal = script,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd("botright split | terminal " .. selection.value)
            end)
            return true
        end,
    }):find()
end

local function configure()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    local telescope_config = PROJECT_CONFIG and PROJECT_CONFIG.telescope or {}
    local file_ignore_patterns = vim.list_extend({ ".git/.*", }, telescope_config.ignored or {})
    local telescope_scripts = telescope_config.scripts or {}

    vim.keymap.set('n', "<leader>ff", builtin.find_files)
    vim.keymap.set('n', "<leader>fs", builtin.live_grep)
    vim.keymap.set('n', "<leader>fr", function() run_scripts_picker(telescope_scripts) end)

    telescope.setup {
        pickers = {
            find_files = {
                hidden = false,
                file_ignore_patterns = file_ignore_patterns,
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
