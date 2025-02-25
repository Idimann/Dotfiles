local hp  = require("harpoon")

hp:setup()

vim.keymap.set("n", "<leader>a", function() hp:list():add() print("Added file!") end)
vim.keymap.set("n", "<leader>h", function() hp.ui:toggle_quick_menu(hp:list()) end)

vim.keymap.set("n", "<leader><leader>", function() hp:list():next( {ui_nav_wrap = true} ) end)

vim.keymap.set("n", "<leader>1", function() hp:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() hp:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() hp:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() hp:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() hp:list():select(5) end)
-- vim.keymap.set("n", "<leader>6", function() hp:list():select(6) end)
-- vim.keymap.set("n", "<leader>7", function() hp:list():select(7) end)
-- vim.keymap.set("n", "<leader>8", function() hp:list():select(8) end)
