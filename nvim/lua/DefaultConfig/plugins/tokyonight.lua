require('tokyonight').setup({
    transparent = true,

    styles = {
        comments = {
            italic = true,
        },
        keywords = {
            bold = true,
        },
        functions = {},
        variables = {}
    },
})

vim.api.nvim_create_user_command('ColorTokyo',
    function()
        vim.cmd("colorscheme tokyonight")
        require('DefaultConfig.plugins.colors').groups(true)
    end,
    {nargs = 0, desc = 'Applies the tokyonight colorscheme'})
