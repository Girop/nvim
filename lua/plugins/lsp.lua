local function lsp_setup()
    vim.lsp.inlay_hint.enable(true)
    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', 'g2', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set('n', 'g3', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            vim.keymap.set({ 'n', 'x' }, 'lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        end
    })

    local cmp = require('cmp')
    local lspkind = require('lspkind')
    cmp.setup({
        sources = { { name = 'nvim_lsp' }, },
        mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            ['<C-s>'] = cmp.mapping.complete(),
            ['<M-j>'] = cmp.mapping.select_next_item(),
            ['<M-k>'] = cmp.mapping.select_prev_item(),
        }),
        formatting = {
            fields = { 'abbr', 'kind', 'menu' },
            format = lspkind.cmp_format({
                mode = 'text_symbol',
                maxwidth = 50,
                ellipsis_char = '...',
            })
        },
    })
end

local function setup_lspconfig()
    require("lspconfig").hls.setup({
        cmd = {
            "/home/ig/.ghcup/bin/haskell-language-server-wrapper",
            "--lsp",
        },
    })
end

local function mason_setup()
    require('mason').setup()
    local mason_lspconfig = require('mason-lspconfig')

    local lspconfig = require('lspconfig')
    local handlers = {
        function(server_name)
            lspconfig[server_name].setup {}
        end,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
        end,
        ['clangd'] = function()
            lspconfig.clangd.setup {
                cmd = {
                    "clangd",
                    '--background-index',
                    '--header-insertion=never',
                    '-j=4',
                    '--inlay-hints=true',
                    '--function-arg-placeholders',
                    '--completion-style=detailed'
                },
            }
        end,
        ['basedpyright'] = function ()
            lspconfig.basedpyright.setup {
                settings = {
                    basedpyright = {
                        typeCheckingMode = "standard",
                    }
                }
            }
        end
    }

    mason_lspconfig.setup({
        ensure_installed = {
            'lua_ls',
            'clangd',
            'basedpyright',
        },
        handlers = handlers,
    })
end

return {
    { 'neovim/nvim-lspconfig', config = setup_lspconfig},
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim', config = mason_setup },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'onsails/lspkind.nvim' },
    { 'ray-x/lsp_signature.nvim' },
    { 'hrsh7th/nvim-cmp',                  config = lsp_setup }
}
