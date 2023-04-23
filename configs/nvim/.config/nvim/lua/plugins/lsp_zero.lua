return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    },

    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.preset({
            name = 'minimal',
            set_lsp_keymaps = true,
            manage_nvim_cmp = true,
            suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            },
        })

        lsp_zero.ensure_installed({
            'tsserver',
            'eslint',
            'rust_analyzer',
            'pyright',
            'lua_ls',
        })


        -- Keymaps
        local cmp = require('cmp')

        cmp.setup{
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer', max_item_count = 2},
                {name = 'path'},
                {name = 'luasnip'},
                {name = 'nvim_lua'},
            },
            experimental = {
                ghost_text = true,
            },
        }
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp_zero.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-l>"] = cmp.mapping.complete(),
            ['<Tab>'] = vim.NIL,
            ['<S-Tab>'] = vim.NIL,
            ['<Up>'] = vim.NIL,
            ['<Down>'] = vim.NIL,
            ['<CR>'] = vim.NIL,
        })


        lsp_zero.setup_nvim_cmp({
            mapping = cmp_mappings
        })

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false, silent = true}
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts) -- main info
            vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "ge", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)


        -- Rust
        lsp_zero.skip_server_setup({ 'rust_analyzer' })

        -- Python
        lsp_zero.configure('pyright', {
            force_setup = true,
        })

        -- Typescript
        lsp_zero.configure('eslint', {
            vim.keymap.set("n", "<leader>ft", '<cmd>LspZeroFormat<CR>')
        })

        -- run lsp
        lsp_zero.nvim_workspace()
        lsp_zero.setup()


        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
        })
    end,
}
