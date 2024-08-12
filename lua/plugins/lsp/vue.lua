require 'lspconfig'.volar.setup {
    init_options = {
        vue = {
            hybridMode = false, -- В гибридном режиме почему то криво работает, отваливается автокоплит для css-module.
        },
    },
}
