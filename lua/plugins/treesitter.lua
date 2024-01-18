require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"html",
		"css",
    "scss",
		"javascript",
		"typescript",
		"vue",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
