vim.g.mapleader = " "
vim.keymap.set("i", "<C-BS>", "<C-W>", { desc = "Remove previous word" })
vim.keymap.set({ "i", "c" }, "<A-BS>", "<C-W>", { desc = "Remove previous word" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over without yanking" })
vim.keymap.set("x", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "<leader>ft", "")
vim.keymap.set("n", "<leader>o", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
