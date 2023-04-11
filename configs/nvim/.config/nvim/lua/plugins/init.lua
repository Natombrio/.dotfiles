return {
    -- Neovim libraries
    'nvim-lua/plenary.nvim',
    -- Utilities
    'tpope/vim-fugitive',
    {"akinsho/toggleterm.nvim", version = '*', config = true},
    'ThePrimeagen/harpoon',
    -- Leap
    'ggandor/leap.nvim',
    -- Github copilot
    'github/copilot.vim',
    -- Theme and Styling
    'folke/tokyonight.nvim',
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
}
