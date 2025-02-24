require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,

    integrations = {
        cmp = false,
    },
})

vim.api.nvim_create_user_command('ColorCat',
    function()
        vim.cmd("colorscheme catppuccin")
        require('DefaultConfig.plugins.colors').groups(true)
    end,
    {nargs = 0, desc = 'Applies the catppuccin colorscheme'})
