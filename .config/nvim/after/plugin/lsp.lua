local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
    underline = false,
})
