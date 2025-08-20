local scratchState = {
    buf = -1,
    win = -1
}

local OpenScratch = function(opts)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = opts.buf
    if not vim.api.nvim_buf_is_valid(buf) then
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value('filetype', 'markdown', {
            buf = buf
        })
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local wrapState = true

CmpState = true

return {
    ToggleScratch = function()
        if not vim.api.nvim_win_is_valid(scratchState.win) then
            scratchState = OpenScratch(scratchState)
        else
            vim.api.nvim_win_hide(scratchState.win)
        end
    end,

    ToggleQuickFix = function()
        local ft = vim.api.nvim_buf_get_option(0, 'filetype')

        if ft == 'qf' then
            vim.cmd('cclose')
        else
            vim.cmd('copen')
        end
    end,

    ToggleWrap = function()
        wrapState = not wrapState
        vim.opt.wrap = wrapState
    end,

    ApplyWrap = function()
        if not wrapState then
            vim.opt.colorcolumn = "80"
        else
            vim.opt.colorcolumn = ""
        end
    end,

    ToggleCmp = function()
        CmpState = not CmpState
        -- vim.api.nvim_input('<C-c>a')
    end,

    SetIndent = function(to)
        vim.opt.tabstop = to
        vim.opt.softtabstop = to
        vim.opt.shiftwidth = to
    end,
}
