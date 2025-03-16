local lspconfig = require('lspconfig')
local cap = require('blink.cmp').get_lsp_capabilities()

lspconfig.clangd.setup({ capabilities = cap })
lspconfig.lua_ls.setup({ capabilities = cap })
lspconfig.pylsp.setup({ capabilities = cap })
lspconfig.rust_analyzer.setup({ capabilities = cap })
lspconfig.gopls.setup({ capabilities = cap })
lspconfig.ts_ls.setup({ capabilities = cap })
lspconfig.zls.setup({ capabilities = cap})
vim.g.zig_fmt_autosave = false
lspconfig.hls.setup({ capabilities = cap })
lspconfig.elixirls.setup({
    capabilities = cap,
    cmd = { "/usr/lib/elixir-ls/language_server.sh" },
})
-- lspconfig.htmx.setup({ capabilities = cap })

vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover({border = 'rounded'}) end);
vim.keymap.set("n", "<leader>j", function()
    vim.diagnostic.open_float({border = 'rounded'}) end);
vim.keymap.set("n", "<leader>l", vim.lsp.buf.format);
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist);
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition);
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration);
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename);
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references);
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action);
