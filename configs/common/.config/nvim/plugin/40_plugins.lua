vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/supermaven-inc/supermaven-nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

-- colorscheme
require("tokyonight").setup({
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})
vim.cmd.colorscheme("tokyonight-storm")

-- mini
require("mini.icons").setup()
MiniIcons.tweak_lsp_kind("replace")
require("mini.completion").setup({
    lsp_completion = { source_func = "omnifunc", auto_setup = true, process_items = process_items },
    window = {
        info = { height = 25, width = 80, border = "single" },
        signature = { height = 25, width = 80, border = "single" },
    },
})
require("mini.extra").setup()
require("mini.pick").setup({
    mappings = {
        to_qf = {
            char = "<C-q>",
            func = function()
                local matches = MiniPick.get_picker_matches()
                if #matches.all > 0 then
                    MiniPick.default_choose_marked(matches.all)
                end
            end,
        },
    },
})
vim.keymap.set("n", "<C-S-f>", MiniPick.builtin.files)
vim.keymap.set("n", "<C-S-g>", MiniPick.builtin.grep_live)
---- mini picker picker
MiniPick.registry.registry = function()
    local items = vim.tbl_keys(MiniPick.registry)
    table.sort(items)
    MiniPick.start({
        source = {
            items = items,
            name = "Registry",
            choose = function(item)
                MiniPick.registry[item]()
            end,
        },
    })
end
vim.keymap.set("n", "<C-p>", MiniPick.registry.registry)

-- supermaven
require("supermaven-nvim").setup({
    keymaps = {
        accept_word = "<A-h>",
        accept_suggestion = "<A-,>",
        clear_suggestion = "<A-.>",
    },
    ignore_filetypes = { "bigfile" },
})

-- treesitter
require("nvim-treesitter").setup()

-- inline diagnostic
require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({ virtual_text = false })
