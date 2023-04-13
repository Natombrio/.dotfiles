return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    keys = {
        { '<leader>rf', "<cmd>NvimTreeToggle<cr>" },
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    lazy = true, -- optional, load on demand
    config = function()
        require('nvim-tree').setup {
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
        }
    end
}
