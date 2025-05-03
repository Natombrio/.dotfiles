return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    depencencies = { "nvim-lua/plenary.nvim" },
    init = function ()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
        vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
    end
}
