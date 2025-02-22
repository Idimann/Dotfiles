require('vague').setup({
    transparent = true,

    colors = {
        bg = "#18191a",
        fg = "#cdcdcd",
        floatBorder = "#878787",
        line = "#282830",
        comment = "#646477",
        builtin = "#bad1ce",
        func = "#be8c8c",
        string = "#deb896",
        number = "#d2a374",
        property = "#c7c7d4",
        constant = "#b4b4ce",
        parameter = "#b9a3ba",
        visual = "#363738",
        error = "#d2788c",
        warning = "#e6be8c",
        hint = "#8ca0dc",
        operator = "#96a3b2",
        keyword = "#7894ab",
        type = "#a1b3b9",
        search = "#465362",
        plus = "#8faf77",
        delta = "#e6be8c",
    },
})

vim.api.nvim_create_user_command('ColorVague',
    function()
        vim.cmd("colorscheme vague")
        require('DefaultConfig.plugins.colors').groups(true)
    end,
    {nargs = 0, desc = 'Applies the vague colorscheme'})
