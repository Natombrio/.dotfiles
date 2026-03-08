return {
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {},
        config = function()
            require("hardtime").setup()
            vim.notify = require("notify")
            vim.notify.setup({
                fps = 1,
            })
        end,
    },
}
