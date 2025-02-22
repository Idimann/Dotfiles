local lspconfig = require('lspconfig')
local cap = require('blink.cmp').get_lsp_capabilities()

lspconfig.clangd.setup({ capabilities = cap })
lspconfig.lua_ls.setup({ capabilities = cap })
lspconfig.pylsp.setup({ capabilities = cap })
lspconfig.rust_analyzer.setup({ capabilities = cap })
lspconfig.gopls.setup({ capabilities = cap })
lspconfig.ts_ls.setup({ capabilities = cap })
lspconfig.zls.setup({ capabilities = cap })
lspconfig.hls.setup({ capabilities = cap })
-- lspconfig.htmx.setup({ capabilities = cap })

vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover);
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition);
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration);
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename);
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references);
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action);

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
