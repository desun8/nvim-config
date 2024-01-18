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
    -- Code highlight
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- Theme
    {
        "folke/tokyonight.nvim",
        priority = 1000, -- Ensure it loads first
    },
    -- AutoComplete
    { "neovim/nvim-lspconfig", dependencies = { "folke/neodev.nvim" } },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { "williamboman/mason.nvim" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    ------
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" }, -- for file icons
    { "jose-elias-alvarez/null-ls.nvim" }, -- usage for integrated lsp formattier
    { "nvim-lualine/lualine.nvim" },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    { "folke/which-key.nvim" },
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" }, -- autoclose and autorename tags
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },
    { "numToStr/Comment.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim" },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    { "cormacrelf/dark-notify" }, -- used to synchronize a theme with the system theme
    { "zbirenbaum/copilot.lua" },
    { "robitx/gp.nvim" }, -- chatgpt client
    { "Exafunction/codeium.vim", event = "BufEnter" },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    { "famiu/bufdelete.nvim" }, -- Remove buffer without deleting windows
})
