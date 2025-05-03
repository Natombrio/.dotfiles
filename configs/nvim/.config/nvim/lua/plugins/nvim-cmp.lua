return {
  "hrsh7th/nvim-cmp",
  opts = function(_, _)
    local cmp = require("cmp")
    cmp.setup({
      preselect = cmp.PreselectMode.None,
    })
  end,
}
