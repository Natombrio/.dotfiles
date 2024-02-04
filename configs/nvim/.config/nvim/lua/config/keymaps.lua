-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- unbind some Lazy default keys

map("n", "<leader>ft", "<nop>")
map("n", "<leader>fT", "<nop>")

map("i", "<C-a>", "<ESC>", { desc = "Exit insert mode" })
map("i", "<C-BS>", "<C-W>", { desc = "Remove previous word" })
map({ "i", "c" }, "<A-BS>", "<C-W>", { desc = "Remove previous word" })
map("x", "<leader>p", '"_dP', { desc = "Paste over without yanking" })
map("x", "<leader>d", '"_d', { desc = "Delete without yanking" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
map("n", "<leader>ft", "")
map("n", "<leader>o", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
