return {
    groups = function(cursor)
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        vim.api.nvim_set_hl(0, "MatchParen", {
            bg = "none",
            fg = "#ffffff", --ff8800
            bold = true,
            -- standout = true
        })
        -- vim.api.nvim_set_hl(0, "IncSearch", {fg = "black", bg = "#ffffff"})
        vim.api.nvim_set_hl(0, "ColorColumn", {bg = "#f5e0dc"})
        if cursor then
            vim.opt.guicursor = "n-v-ve-r-cr-i-ci-o-c-sm:block-blinkwait100-blinkoff400-blinkon250"
        end
        --vim.api.nvim_set_hl(0, 'TreesitterContext', { fg = "#ffffff", bg = "#333333" })
    end
};
