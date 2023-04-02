require('toggleterm').setup{
    size = 10,
    open_mapping = [[<leader>o]],
    hide_numbers = true,
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = 'curved',
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        winblend = 3,
        highlights = {
        border = "Normal",
        background = "Normal",
        }
    }
}
