-- Editing and formatting
vim.keymap.set('i','<C-a>', '<ESC>')
vim.keymap.set('x','<leader>p', '\"_dP')
vim.keymap.set('x','<leader>d', '\"_d')
vim.keymap.set('n','<leader>ft', 'gg=G')
vim.keymap.set('n','<C-c>', '<cmd>noh<CR>')
vim.keymap.set('n','<C-d>', '<C-d>zz')
vim.keymap.set('n','<C-u>', '<C-u>zz')
vim.keymap.set('n','ä', ':')
vim.keymap.set('n', '<C-q>n', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-q>p', '<cmd>cprev<CR>')

-- Split controls
vim.keymap.set('n','<C-w>|', '<cmd>vsplit<CR>')
vim.keymap.set('n','<C-w>-', '<cmd>split<CR>')
vim.keymap.set('n','<C-w>ff', '<cmd>vsplit<CR><CMD>Telescope find_files<CR>')
vim.keymap.set('n','<C-w>fi', '<cmd>vsplit<CR><CMD>Telescope live_grep<CR>')
vim.keymap.set('n', '<M-h>', "<C-w>h",{silent = true})
vim.keymap.set('n', '<M-j>', "<C-w>j",{silent = true})
vim.keymap.set('n', '<M-k>', "<C-w>k",{silent = true})
vim.keymap.set('n', '<M-l>', "<C-w>l",{silent = true})

-- Terminals
vim.keymap.set('n','<C-w>t|', '<cmd>vsplit<CR><cmd>terminal<CR>')
vim.keymap.set('n','<C-w>t-', '<cmd>split<CR><cmd>terminal<CR>')
vim.keymap.set('t', '<M-h>', "<C-\\><C-n><C-w>h",{silent = true})
vim.keymap.set('t', '<M-j>', "<C-\\><C-n><C-w>j",{silent = true})
vim.keymap.set('t', '<M-k>', "<C-\\><C-n><C-w>k",{silent = true})
vim.keymap.set('t', '<M-l>', "<C-\\><C-n><C-w>l",{silent = true})

-- Resizing splits
vim.keymap.set('n','<Left>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('n','<Right>', '<cmd>vertical resize +2<CR>')
vim.keymap.set('n','<Up>', '<cmd>resize -2<CR>')
vim.keymap.set('n','<Down>', '<cmd>resize +2<CR>')

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

-- find and replace word under cursor
vim.keymap.set('n', '<leader>sr', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')


-- highlight on yank
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- unmap arrowkeys
vim.keymap.set('i', '<Left>', '<nop>')
vim.keymap.set('i', '<Down>', '<nop>')
vim.keymap.set('i', '<Up>', '<nop>')
vim.keymap.set('i', '<Right>', '<nop>')
