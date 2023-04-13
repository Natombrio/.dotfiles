return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        -- if you are running from vscode, don't activate lualine
        if not vim.g.vscode then
            local vimmode = {'mode', fmt = function(str) return str:sub(1,1) end}
            require('lualine').setup{
                options = {
                    theme = 'tokyonight',
                    component_separators = '',
                    section_separators = { left = '', right = ''},
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {vimmode},
                    lualine_b = {
                        'branch', 'diff', {
                            'diagnostics',
                            sources = {'nvim_diagnostic'},
                            symbols = {error = '', warn = '', info = '', hint = ''},
                        },
                    },
                    lualine_c = {'filename'},
                    lualine_x = {''},
                    lualine_y = {'filetype'},
                    lualine_z = {'location'},
                },
                inactive_winbar = {
                    lualine_a = {''},
                    lualine_b = {''},
                    lualine_c = {''},
                    lualine_x = {''},
                    lualine_y = {''},
                    lualine_z = {'filename'},
                },
                winbar = {
                    lualine_a = {''},
                    lualine_b = {''},
                    lualine_c = {''},
                    lualine_x = {''},
                    lualine_y = {''},
                    lualine_z = {'filename'},
                },
            }
        end
    end,
}
