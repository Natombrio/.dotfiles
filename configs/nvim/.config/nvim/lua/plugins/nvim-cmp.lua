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
    {
      "<C-n>",
      function()
        if require("cmp").visible then
          require("cmp").select_next_item()
        end
      end,
      mode = "i",
    },
    {
      "<C-p>",
      require("cmp").mapping.select_prev_item(),
      mode = "i",
    },
  },
}
