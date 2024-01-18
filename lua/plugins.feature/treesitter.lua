return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = true,
    init = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "html",
            "css",
            "javascript",
            "typescript",
            "vue",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end,
}
