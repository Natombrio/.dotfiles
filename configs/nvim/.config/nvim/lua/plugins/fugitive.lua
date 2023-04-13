-- Credit: ThePrimeagen
return {
    'tpope/vim-fugitive',
    cmd = "Git",
    config = function()

        local fugitive_auto = vim.api.nvim_create_augroup("fugitive_auto", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = fugitive_auto,
            pattern = "*",

            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set("n", "<leader>p", "<cmd>Git pull --rebase<CR>", opts)
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
                vim.keymap.set("n", "<leader>ga", "<cmd>Git fetch --all<CR>")
                vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
                vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")
            end,
        })
    end
}