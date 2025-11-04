local cap = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('*', { capabilities = cap })
vim.lsp.config.elixirls = {
    capabilities = cap,
    cmd = { "/usr/lib/elixir-ls/language_server.sh" },
}
vim.lsp.enable({ 'lua_ls',
    'rust_analyzer',
    'elixirls',
    'clangd',
    'zls',
})

vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover({ border = 'single' }) end);
vim.keymap.set("n", "<leader>j", function()
    vim.diagnostic.open_float({ border = 'single' })
end);
vim.keymap.set("n", "<leader>l", vim.lsp.buf.format);
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist);
vim.keymap.set("n", "gd", vim.lsp.buf.definition);
vim.keymap.set("n", "gD", vim.lsp.buf.declaration);
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename);
-- vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references);
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action);
