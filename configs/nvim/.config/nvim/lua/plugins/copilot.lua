return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
      auto_trigger = false,
      debounce = 75,
    },
  },
  keys = function()
    return {
      {
        "<M-e>",
        function()
          if require("copilot.client").is_disabled() then
            vim.cmd("Copilot enable")
            vim.cmd("echohl InfoMsg | echom 'Enabled' | echohl None")
          else
            require("copilot.suggestion").dismiss()
            vim.cmd("Copilot disable")
            vim.cmd("echohl InfoMsg | echom 'Disabled' | echohl None")
          end
        end,
        expr = true,
        silent = true,
        mode = { "n", "i" },
      },
      {
        "<M-y>",
        require("copilot.suggestion").accept,
        mode = { "i" },
      },
      {
        "<M-i>",
        require("copilot.suggestion").accept_line,
        mode = { "i" },
      },
      {
        "<M-l>",
        require("copilot.suggestion").next,
        mode = { "i" },
      },
    }
  end,
}
