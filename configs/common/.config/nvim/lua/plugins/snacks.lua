return {
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        lazy = false,
        opts = {
            picker = {},
            bigfile = {
                notify = true,
            },
        },
        keys = {
            { "<C-S-f>", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<C-S-g>", function() Snacks.picker.grep() end, desc = "Find Live Grep" },
            { "<C-p>", function() Snacks.picker.pick() end, desc = "Picker list" },
        }
    },
}
