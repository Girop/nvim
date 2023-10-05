-- Tree
vim.cmd [[let g:nvim_tree_gitignore = 0]]

local function is_nvim_tree()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
        return true
    else
        return false
    end
end

vim.keymap.set("n", "<leader>pb", "<CMD>NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<leader>pv", function()
    if is_nvim_tree() then
        vim.api.nvim_command("wincmd p")
    else
        vim.api.nvim_command("NvimTreeFocus")
    end
end)

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

require("nvim-tree").setup({
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
        -- mappings = {
        --     custom_only = true
        -- },
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
    }
})

vim.keymap.set("n", "<leader>ct", "<CMD>NvimTreeCollapse<CR>")

-- telescope
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
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>hh', builtin.search_history)

-- Lualine
local status, lualine = pcall(require, 'lualine')

if (not status) then return end
lualine.setup {
    -- sections = {},
    -- inactive_sections = {},
    disable_statusline = false,
    options = {
        icons_enabled = true,
        theme = 'auto'
    }
}


-- Treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "query",
        "python",
        "comment",
        "rust",
        "cpp",
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
}

-- Lsp (zero)
local lsp = require("lsp-zero")
lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<CR>"] = cmp.config.disable,
    ['<M-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<M-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ["<C-s>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp { preselect = cmp.PreselectMode.None, mapping = cmp_mappings }

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    -- not working?
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.lsp.buf.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
end)

vim.keymap.set("n", "<leader>k", function()
    vim.lsp.buf.format()
end)

lsp.setup()

local cmp_nvim_lsp = require "cmp_nvim_lsp"
require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        '-header-insertion=never',
    },
}

local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    }
}

-- Toggleterm
function RunFile()
    local current_filename = vim.api.nvim_buf_get_name(0)
    local function get_python()
        if vim.fn.has('windows') then
            return 'python'
        end
        return 'python3'
    end

    -- TODO surely i can do it better way
    local commands = {
        ['rust'] = 'cargo run',
        ['python'] = get_python() .. ' ' .. current_filename,
        ['c'] = "make -j 8 && ./main",
        ['cpp'] = "make -j 8 && ./main",
        ['go'] = 'go run .',
        ['tex'] = 'pdflatex ' .. current_filename,
    }
    return commands[vim.bo.filetype]
end

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd [[autocmd! TermOpen term://* lua set_terminal_keymaps()]]
vim.cmd [[command! -count=1 TermCodeRun lua require'toggleterm'.exec(RunFile(), <count>, 40)]]
vim.cmd [[command! -count=1 TermGitAdd lua require'toggleterm'.exec("git add .", <count>, 40)]]
vim.cmd [[command! -count=1 TermGitCommit lua require'toggleterm'.exec("git commit", <count>, 40)]]

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>TermCodeRun<cr>")

require("toggleterm").setup {
    autochdir = true,
    start_in_insert = true,
    direction = "vertical",
    auto_scroll = true,
}

-- Git integration, TODO FIX merges
vim.keymap.set('n', '<leader>gi', vim.cmd.Git)
local IgAutogroup = vim.api.nvim_create_augroup("IgAutogroup", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = IgAutogroup,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git('pull')
        end, opts)

        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})

vim.keymap.set("n", "gq", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gp", "<cmd>diffget //3<CR>")

-- Stuff
require('nvim_comment').setup()
require("nvim-web-devicons").setup {
    color_icons = true,
    default = true,
}

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Blamer
vim.cmd("let g:blamer_enabled = 1")
vim.cmd("let g:blamer_relative_time = 1")
vim.cmd("let g:blamer_delay = 100")

-- Trouble
require("trouble").setup {}

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)

-- Tmux navigation
vim.cmd [[
    let g:tmux_navigator_no_mappings = 1
    noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
    noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
    noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
    noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>
]]
