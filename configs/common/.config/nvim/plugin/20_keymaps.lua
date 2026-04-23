vim.g.mapleader = " "
vim.keymap.set("n", "q:", ":", { desc = "Unbind command mode search" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("x", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "<C-S-j>", ":cnext<CR>", { desc = "Go to next in quickfix" })
vim.keymap.set("n", "<C-S-k>", ":cprevious<CR>", { desc = "Go to previous in quickfix" })
vim.keymap.set("n", "<C-S-l>", ":lnext<CR>", { desc = "Go to next in quickfix" })
vim.keymap.set("n", "<C-S-h>", ":lprevious<CR>", { desc = "Go to previous in quickfix" })

