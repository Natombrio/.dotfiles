return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_word = "<A-h>",
                    accept_suggestion = "<A-,>",
                    clear_suggestion = "<A-.>",
                },
                ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif"},
            })
        end,
    },
}
