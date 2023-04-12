return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<M-y>",
                    accept_line = "<M-l>",
                    toggle_auto_trigger = "<M-n>",
                },
            },
        })
    end,
}
