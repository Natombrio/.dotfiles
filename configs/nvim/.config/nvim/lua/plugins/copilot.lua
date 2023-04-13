return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = false,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<M-y>",
                    accept_line = "<M-l>",
                    next = false,
                    prev = false,
                    dismiss = false,
                },
            },
            vim.keymap.set({"n","i"}, "<M-e>", function ()
                if (require("copilot.client").is_disabled()) then
                    vim.cmd("Copilot enable")
                    vim.cmd("echohl InfoMsg | echom 'Enabled' | echohl None")
                else
                    require("copilot.suggestion").dismiss()
                    vim.cmd("Copilot disable")
                    vim.cmd("echohl InfoMsg | echom 'Disabled' | echohl None")
                end
            end
            ),
        })
    end,
}
