local lsps = {
    {
        "ruff",
        {
            cmd = { "uv", "run", "ruff", "server" },
            root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
            filetypes = { "python" },
        },
    },
    {
        "zuban",
        {
            cmd = { "uv", "run", "zuban", "server" },
            root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
            filetypes = { "python" },
        },
    },
    {
        "stylua",
        {
            cmd = { "stylua", "--lsp" },
            root_markers = { ".stylua.toml", "stylua.toml", ".editorconfig" },
            filetypes = { "lua" },
        },
    },
    {
        "lua_ls",
        {
            cmd = { "lua-language-server" },
            root_markers = {
                { ".emmyrc.json", ".luarc.json", ".luarc.jsonc" },
                { ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
                { ".git" },
            },
            filetypes = { "lua" },
        },
    },
}

for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end

vim.diagnostic.handlers.loclist = {
    show = function(_, _, _, opts)
        -- Generally don't want it to open on every update
        opts.loclist.open = opts.loclist.open or false
        local winid = vim.api.nvim_get_current_win()
        vim.diagnostic.setloclist(opts.loclist)
        vim.api.nvim_set_current_win(winid)
    end,
}
