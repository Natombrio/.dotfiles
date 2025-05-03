return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd("colorscheme tokyonight-storm")
    end,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
