return {
    {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = { "nvim-lua/plenary.nvim", },

    config = function()
        require('telescope').setup()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.builtin, {})
    end,
    }
}
