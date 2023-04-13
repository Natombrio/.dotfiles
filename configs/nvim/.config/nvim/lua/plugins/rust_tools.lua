return {
    'simrat39/rust-tools.nvim',
    config = function()
        local zero_lsp_server = require("lsp-zero").build_options("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    inlayHints = {
                        locationLinks = false,
                    },
                    checkOnSave = { command = "clippy" },
                },
            },
        })
        require("rust-tools").setup({
            tools = {
                inlay_hints = {
                    auto = true,
                    parameter_hints_prefix = "",
                    other_hints_prefix = "",
                }
            },
            server = zero_lsp_server
        })
    end,
}
