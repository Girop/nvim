return {
    'nvim-tree/nvim-tree.lua',
	dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {"<leader>ct", "<CMD>NvimTreeCollapse<CR>"},
        {"<leader>pb", "<CMD>NvimTreeToggle<CR>"},
        {"<leader>pv", function()
            if is_nvim_tree() then
                vim.api.nvim_command("wincmd p")
            else
                vim.api.nvim_command("NvimTreeFocus")
            end
        end},
    },
    config = function()
        vim.cmd[[let g:nvim_tree_gitignore = 0]]

        local function is_nvim_tree()
            if vim.api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
                return true
            else
                return false
            end
        end

        local api = require('nvim-tree.api')
        local all_keymaps = {
            ["<CR>"] = api.node.open.edit,
            ["<M-l>"] = api.node.navigate.parent_close,
            ["<Down>"] = api.node.navigate.sibling.next,
            ["<Up>"] = api.node.navigate.sibling.prev,
            ["<Tab>"] = api.node.open.preview,
            ["<c-r>"] = api.tree.reload,
            ["a"] = api.fs.create,
            ["de"] = api.fs.remove,
            ["i"] = api.fs.rename,
            ["dd"] = api.fs.cut,
            ["y"] = api.fs.copy.filename,
            ["0"] = api.node.navigate.parent,
            ["p"] = api.fs.paste,
            ["<c-o>"] = api.node.run.system,
            ["<c-f>"] = api.tree.search_node,
        }

        local on_attach = function(bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
            for keys, cmd in pairs(all_keymaps) do
                vim.keymap.set('n', keys, cmd, opts)
            end
        end
        require('nvim-tree').setup{
            sort_by = "case_sensitive",
            on_attach = on_attach,
            auto_reload_on_write = true,
            disable_netrw = true,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true
            },
            git = {
                ignore = false,
            },
            view = {
                side = "right",
                centralize_selection = true,
            },
            renderer = {
                root_folder_label = false,
                group_empty = false,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
                icons = {
                    info = "I",
                    warning = "W",
                    error = "E",
                },
            },
        }
    end,
}
