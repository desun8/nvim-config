local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Theme
    {
        "folke/tokyonight.nvim",
        priority = 1000, -- Ensure it loads first
    },
    { "cormacrelf/dark-notify" }, -- used to synchronize a theme with the system theme
    -- Code highlight
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- Color highlight
    { "NvChad/nvim-colorizer.lua" },
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "nvimtools/none-ls.nvim" }, -- usage for integrated lsp formattier
    -- AutoComplete
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    -- File navigation
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-tree/nvim-tree.lua" },
    -- Git
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim" },
    -- AI
    { "robitx/gp.nvim" }, -- chatgpt client
    -- { "Exafunction/codeium.vim", event = "BufEnter" },
    -- UI
    { "nvim-tree/nvim-web-devicons" }, -- for file icons (also a dependency for other plugins)
    { "nvim-lualine/lualine.nvim" },
    -- Utils
    { "famiu/bufdelete.nvim" }, -- Remove buffer without deleting windows
    { "folke/which-key.nvim" },
    { "rmagatti/auto-session" }, -- safe & restore session
    { "numToStr/Comment.nvim" },
    -- { "windwp/nvim-autopairs" },
    -- { "windwp/nvim-ts-autotag" }, -- autoclose and autorename tags
    -- {
    --     "kylechui/nvim-surround",
    --     version = "*", -- Use for stability; omit to use `main` branch for the latest features
    --     event = "VeryLazy",
    -- },
    -- { "akinsho/toggleterm.nvim", version = "*", config = true },
    -- { "zbirenbaum/copilot.lua" },
    -- {
    --     "nvimdev/dashboard-nvim",
    --     event = "VimEnter",
    --     dependencies = { { "nvim-tree/nvim-web-devicons" } },
    -- },
})
