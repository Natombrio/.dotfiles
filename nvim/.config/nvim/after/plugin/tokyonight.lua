require("tokyonight").setup({
    style = "night",
    transparent = true,
    styles = {
        comments = { italic = false },
        keywords = { italic = true },
    },
    dim_inactive = true,
    on_highlights = function(highlights, colors)
        highlights.LineNr = {
            fg = colors.white,
        }
        highlights.LineNrBelow = {
            fg = colors.blue,
        }
        highlights.LineNrAbove = {
            fg = colors.blue,
        }
    end,
})
vim.cmd("colorscheme tokyonight")
