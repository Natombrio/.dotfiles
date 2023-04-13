return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
            vim.keymap.set("n", "<leader>qf", "<cmd>TroubleToggle quickfix<cr>", 
            {silent = true, noremap = true}),
        }
    end,
}
