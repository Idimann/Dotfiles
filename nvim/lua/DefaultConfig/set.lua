vim.opt.guicursor = "n-v-ve-r-cr-i-ci-o-c-sm:block-blinkwait100-blinkoff400-blinkon250"

vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.netrw_banner = false

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

local custom = require("DefaultConfig.custom")
custom.ApplyWrap()

local cmdGroup = vim.api.nvim_create_augroup("lol", { clear = true })

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = cmdGroup,
    pattern = "*",
    callback = function(--[[opts]])
        --if vim.bo[opts.buf].filetype == 'lua' or vim.bo[opts.buf].filetype == 'python' then
        vim.cmd [[%s/\s\+$//e]]
        --end
    end
})

vim.api.nvim_create_autocmd({'TextYankPost'}, {
    group = cmdGroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- vim.api.nvim_create_autocmd({'InsertLeave'}, {
--     group = cmdGroup,
--     pattern = '*',
--     callback = function()
--         CmpState = false
--     end,
-- })
