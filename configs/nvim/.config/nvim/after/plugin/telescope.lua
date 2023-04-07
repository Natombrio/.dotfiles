local builtin = require('telescope.builtin')

-- list git files when in a git repo
local project_files = function()
  local opts = {} -- define here if you want to define something
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files(opts)
  else
    require"telescope.builtin".find_files(opts)
  end
end

if vim.fn.argc() == 0 then
    vim.defer_fn(function()
        project_files()
    end, 0)
end

vim.keymap.set('n',"<leader>ff", project_files, {})
vim.keymap.set('n',"<C-p>", ":Telescope<CR>")
vim.keymap.set('n',"<leader>fi", builtin.live_grep, {})
