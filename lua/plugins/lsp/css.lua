--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
    capabilities = capabilities,
})

require("lspconfig").css_variables.setup({
    filetypes = { "css", "vue" },
    settings = {
        lookupFiles = { "**/variables/*.css" },
    },
})
