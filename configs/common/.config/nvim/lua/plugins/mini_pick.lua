return {
    {
        "nvim-mini/mini.pick",
        config = function()
            require('mini.pick').setup({
                options = {
                    use_cache = true
                },
                mappings = {
                    mark_all = '<C-a>',
                },
            })
            local pick = MiniPick
            vim.keymap.set('n', '<C-S-F>', pick.builtin.files)
            vim.keymap.set('n', '<C-S-G>', pick.builtin.grep_live)
        end,
    },
}
