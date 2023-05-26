return {
  "hrsh7th/nvim-cmp",
  keys = {
    {
      "<C-y>",
      require("cmp").mapping.confirm({ select = true }),
      mode = "i",
      expr = true,
    },
    {
      "<C-l>",
      require("cmp").mapping.complete(),
      mode = "i",
    },
  },
}
