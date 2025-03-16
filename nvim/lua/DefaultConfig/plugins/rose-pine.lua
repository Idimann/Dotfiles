require('rose-pine').setup({
    disable_background = true,
    disable_float_background = true,

    enable = {
        terminal = true,
    },

    styles = {
        bold = true,
        italic = false,
        transparency = true
    },

    groups = {
        background = 'base',
    }
})

vim.api.nvim_create_user_command('ColorRose',
    function()
        vim.cmd("colorscheme rose-pine-moon")
        require('DefaultConfig.plugins.colors').groups(true)
    end,
    {nargs = 0, desc = 'Applies the rose-pine-moon colorscheme'})
