require('telescope').setup({
    defaults = {
        -- layout_strategy = 'bottom_pane',
        -- sorting_strategy = 'descending',
        -- borderchars = { "─", " ", "─", " ", " ", " ", " ", " " },
        previewer = false,

        layout_config = {
            bottom_pane = {
                height = 12,
                preview_cutoff = 120,
                prompt_position = "bottom",
            },

            horizontal = {
                height = 15,
                width = 50,
            },
        },
    },

    extensions = {
        fzf = {}
    },
})

-- require("telescope").load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fl', builtin.lsp_workspace_symbols, {})
