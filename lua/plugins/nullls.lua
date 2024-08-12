local null_ls = require("null-ls")
-- Use for formatting on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.ltrs,
        null_ls.builtins.formatting.prettierd.with({
            filetypes = {
                "css",
                "scss",
                "less",
                "html",
                "json",
                "jsonc",
                "yaml",
                "markdown",
                "markdown.mdx",
                "graphql",
                "handlebars",
            },
        }),
    },
})
