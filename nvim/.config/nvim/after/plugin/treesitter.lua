require('nvim-treesitter.install').compilers = { "gcc", "clang" }
require('nvim-treesitter.configs').setup {
    ensure_installed = {"rust","javascript", "python", "lua", "help", "bash", "css", "http", "html", "markdown", "yaml", "toml"},
    highlight = { enable = true },
    additional_vim_regex_highlighting = false,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "tsr",
            node_incremental = "+",
            node_decremental = "-",
        },
    },
}
