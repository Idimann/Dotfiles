require'nvim-treesitter.configs'.setup {
    -- ensure_installed = {
    --     "c",
    --     "cpp",
    --     "lua",
    --     "javascript",
    --     "typescript",
    --     "python",
    --     "rust",
    --     "java",
    -- },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        -- disable = { "latex" }, --Very important
        additional_vim_regex_highlighting = "latex"
    },

    indent = {
        enable = { "elixir" },
    },
}

require'treesitter-context'.setup {
    enable = true,
    max_lines = 1,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 3, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'inner',
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
