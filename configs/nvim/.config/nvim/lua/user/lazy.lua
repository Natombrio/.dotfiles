local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })

end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Neovim libraries
    'nvim-lua/plenary.nvim',
    -- Utilities
    'tpope/vim-fugitive',
    {"akinsho/toggleterm.nvim", version = '*', config = true},
    'ThePrimeagen/harpoon',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    -- Leap
    'ggandor/leap.nvim',
    -- Github copilot
    'github/copilot.vim',
    -- Theme and Styling
    'folke/tokyonight.nvim',
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    -- Error display
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
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
        }
    },
    -- Editing
    "nvim-treesitter/nvim-treesitter-context",
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    'mbbill/undotree',
    {'nvim-treesitter/nvim-treesitter', build =':TSUpdate'},
    'nvim-telescope/telescope.nvim',
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",

        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end

    },
    -- Language Specific Settings
    ---- Rust
    'simrat39/rust-tools.nvim',
})
