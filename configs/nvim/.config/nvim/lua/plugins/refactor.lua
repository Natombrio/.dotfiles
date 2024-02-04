return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { mode = "x", "<leader>ref", ":Refactor extract ", desc = "Extract function" },
    { mode = "x", "<leader>rev", ":Refactor extract_var ", desc = "Extract variable" },
    { mode = "n", "<leader>rif", ":Refactor inline_func ", desc = "Refactoring inline func" },
    { mode = { "n", "x" }, "<leader>riv", "<cmd>Refactor inline_var<cr>", desc = "Refactoring inline var" },
    { mode = "x", "<leader>reb", ":Refactor extract_block ", desc = "Refactoring extract block" },
  },
  ft = { "lua", "ts", "js", "go", "py" },
  config = function()
    require("refactoring").setup()
  end,
}
