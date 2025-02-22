require("gruber-darker").setup({
    transparent = true
})

vim.api.nvim_create_user_command('ColorGruber',
    function()
        vim.cmd("colorscheme gruber-darker")
        require('DefaultConfig.plugins.colors').groups(false)
    end,
    {nargs = 0, desc = 'Applies the gruber-darker colorscheme'})
