require('material').setup({
    disable = {
        colored_cursor = true,
        background = true,
    }
})

vim.api.nvim_create_user_command('ColorMaterial',
    function()
        vim.cmd("colorscheme material-darker")
        require('DefaultConfig.plugins.colors').groups(true)
    end,
    {nargs = 0, desc = 'Applies the material-darker colorscheme'})
