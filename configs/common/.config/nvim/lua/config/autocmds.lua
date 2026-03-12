local function augroup(name)
  return vim.api.nvim_create_augroup("Natombrio" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "robot", "resource" },
  callback = function()
    vim.opt_local.commentstring = "# %s"
  end,
})

vim.filetype.add({
  extension = {
    -- Map the .rpy extension to the 'renpy' filetype
    rpy = 'renpy',
  },
})

local augroup = vim.api.nvim_create_augroup
local NatombrioGroup = augroup('Natombrio', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd('LspAttach', {
    group = NatombrioGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "grd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "grh", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "grz", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "gra", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "gfm", function() vim.lsp.buf.format() end, opts)
    end
})
