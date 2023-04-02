vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options

vim.keymap.set('n','<leader>rf', require('nvim-tree.api').tree.toggle)

require('nvim-tree').setup({

    sort_by = 'case_sensitive',
    sync_root_with_cwd = true,
    view = {
        width = 30,
        mappings = {
            list = {
                { key = 'u', action = 'dir_up' },
                { key = 'c', action = 'cd' },
            },
        },
    },
    renderer = {
        group_empty = false,
    },
    filters = {
        dotfiles = false,
    },
})

