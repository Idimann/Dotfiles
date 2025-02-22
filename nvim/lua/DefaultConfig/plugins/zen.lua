require("zen-mode").setup {
    window = {
        width = 120,
    },

    plugins = {
        options = {
            enabled = true,

            ruler = true,
            showcmd = true,
        },

        tmux = {
            -- enabled = true,
        },
    },
}

vim.keymap.set("n", "<leader>z", function()
    require("zen-mode").toggle()
end)
