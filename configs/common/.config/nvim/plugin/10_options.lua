-- Opts
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.splitkeep = "screen"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 4000

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd.packadd("cfilter")
vim.cmd.packadd("nohlsearch")
require("vim._core.ui2").enable()

-- Disable syntax highlighting for large files to avoid E363 errors
local large_file_group = vim.api.nvim_create_augroup("LargeFile", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = large_file_group,
    callback = function(args)
        local filesize = vim.fn.getfsize(vim.fn.fnamemodify(args.file, ":p"))
        -- Disable syntax for files larger than 1MB
        if filesize > 1048576 then
            vim.bo[args.buf].syntax = "off"
            vim.cmd("redraw!")
        end
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "robot", "resource" },
    callback = function()
        vim.opt_local.commentstring = "# %s"
    end,
})

vim.filetype.add({
    extension = {
        -- Map the .rpy extension to the 'renpy' filetype
        rpy = "renpy",
    },
})

local augroup = vim.api.nvim_create_augroup
local NatombrioGroup = augroup("Natombrio", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("LspAttach", {
    group = NatombrioGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "grd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "grh", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "grr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "grz", function()
            vim.lsp.buf.format()
        end, opts)
        vim.keymap.set("n", "gra", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "grn", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1 })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1 })
        end, opts)
        vim.keymap.set("n", "gfm", function()
            vim.lsp.buf.format()
        end, opts)
    end,
})

local follow_augroup = vim.api.nvim_create_augroup("FileFollow", { clear = true })
local _follow_enabled = false

local function set_follow(state)
    _follow_enabled = state
    if state then
        vim.o.updatetime = 2000 -- Lower default (4000) so it fires faster
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
            group = follow_augroup,
            callback = function(args)
                if not vim.bo[args.buf].readonly then
                    vim.cmd.checktime()
                end
            end,
        })
        vim.notify("Auto-reload enabled", vim.log.levels.INFO)
    else
        vim.api.nvim_clear_autocmds({ group = follow_augroup })
        vim.notify("Auto-reload disabled", vim.log.levels.WARN)
    end
end

vim.api.nvim_create_user_command("Follow", function(args)
    if args.bang then
        set_follow(false)
    else
        set_follow(not _follow_enabled)
    end
end, { bang = true, desc = "Toggle auto-reload on external file changes" })
