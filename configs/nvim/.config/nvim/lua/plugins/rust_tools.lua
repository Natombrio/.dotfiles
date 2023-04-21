return {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    config = function()
        local zero_lsp_server = require("lsp-zero").build_options("rust_analyzer", {
            assist = {
                importEnforceGranularity = true,
            },
            settings = {
                ["rust-analyzer"] = {
                    inlayHints = {
                        locationLinks = false,
                    },
                    checkOnSave = {
                        command = "clippy",
                        allFeatures = true
                    },

                },
            },
        })
        require("rust-tools").setup({
            tools = {
                auto_set_hints = true,
                inlay_hints = {
                    auto = true,
                    show_parameter_hints = true,
                    parameter_hints_prefix = "<- ",
                    other_hints_prefix = "=> ",
                }
            },
            server = zero_lsp_server
        })
    end,
}
