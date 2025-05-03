return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                signs = {
                    error = "E",
                    warning = "W",
                    hint = "H",
                    information = "I",
                },
                mode = "workspace_diagnostics",
                auto_close = true,
                auto_jump = {"lsp_references", "lsp_definitions"},
                include_declaration = { "lsp_definitions", "lsp_implementations" },

            })

            vim.keymap.set("n", "<leader>t", function()
                require("trouble").toggle("workspace_diagnostics")
            end)

            vim.keymap.set("n", "gr", function()
                require("trouble").toggle("lsp_references")
            end)

            vim.keymap.set("n", "[t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end)

            vim.keymap.set("n", "]t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end)

        end
    },
}
