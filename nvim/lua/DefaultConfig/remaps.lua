vim.g.mapleader = " "

local custom = require("DefaultConfig.custom")

--General
vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")

--Mappings
vim.keymap.set("n", "<leader>n", "<cmd>Ex<cr>")

--Line moving
vim.keymap.set("v", "J", ":m '>+1<cr>gv=k==jgv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
--Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--Linewrap
vim.keymap.set("n", "<leader>w", function()
    custom.ToggleWrap()
    custom.ApplyWrap()
end)

-- Completion
-- vim.keymap.del("i", "<C-x>")

--Cmp
vim.keymap.set("i", "<C-h>", custom.ToggleCmp)

--Quickfix list
vim.keymap.set("n", "<leader>q", custom.ToggleQuickFix)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>zz")

--Cursor positioning
vim.keymap.set("n", "<C-u>", "<cmd>set scroll=0<cr><C-u>zz")
vim.keymap.set("n", "<C-d>", "<cmd>set scroll=0<cr><C-d>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "J", "mzJ`z")

--Neorg
--vim.keymap.set("n", "<leader>og", ":Neorg index<cr>")
--vim.keymap.set("n", "<leader>ob", ":w<cr>:Neorg return<cr>")

--TSPlayground
vim.keymap.set("n", "<leader>t", "<cmd>TSPlaygroundToggle<cr>")

--Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>v", "<cmd>r!wl-paste<cr>") --After years i finally got this
vim.keymap.set("v", "<leader>v", "!wl-paste<cr>")
--vim.keymap.set("n", "<leader>V", "\"+P")
vim.keymap.set("n", "<leader>p", "\"_dP")

-- vim.keymap.set("n", "<leader>tst", function() print(vim.fn.expand('%:t')) end)

vim.keymap.set('n', "<leader>m", "<cmd>!make<CR><cmd>echo \"Rebuilt the project\"<CR>", { noremap = true, silent = true })

--vim.api.nvim_set_keymap('n', "<leader>t", "<cmd>split term://zsh<CR>:resize 10<CR>i", {noremap = true, silent = true})

vim.keymap.set('n', "<leader>s", custom.ToggleScratch, { noremap = true })

vim.api.nvim_set_keymap('t', "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

--Colors
vim.keymap.set('n', "<leader>c1", "<cmd>ColorRose<CR>");
vim.keymap.set('n', "<leader>c2", "<cmd>ColorCat<CR>");
vim.keymap.set('n', "<leader>c3", "<cmd>ColorMaterial<CR>");
-- vim.keymap.set('n', "<leader>c2", "<cmd>ColorGruv<CR>");
-- vim.keymap.set('n', "<leader>c3", "<cmd>ColorGruber<CR>");
-- vim.keymap.set('n', "<leader>c4", "<cmd>ColorVague<CR>");
