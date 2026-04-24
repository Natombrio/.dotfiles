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
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most
                        -- likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Tell the language server how to find Lua modules same way as Neovim
                        -- (see `:h lua-module-load`)
                        path = {
                            "lua/?.lua",
                            "lua/?/init.lua",
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                            vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                            -- Depending on the usage, you might want to add additional paths
                            -- here.
                            -- '${3rd}/luv/library',
                            -- '${3rd}/busted/library',
                        },
                        -- Or pull in all of 'runtimepath'.
                        -- NOTE: this is a lot slower and will cause issues when working on
                        -- your own configuration.
                        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                        -- library = vim.api.nvim_get_runtime_file('', true),
                    },
                })
            end,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        },
    },
    {
        "html",
        {
            cmd = function(dispatchers, config)
                local cmd = "vscode-html-language-server"
                if (config or {}).root_dir then
                    local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
                    if vim.fn.executable(local_cmd) == 1 then
                        cmd = local_cmd
                    end
                end
                return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
            end,
            filetypes = { "html" },
            root_markers = { "package.json", ".git" },
            ---@type lspconfig.settings.html
            settings = {},
            init_options = {
                provideFormatter = true,
                embeddedLanguages = { css = true, javascript = true },
                configurationSection = { "html", "css", "javascript" },
            },
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
