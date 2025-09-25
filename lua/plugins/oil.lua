return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
		require("oil").setup({
			vim.keymap.set("n", "\\", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
			vim.keymap.set("n", "C-b", require("oil").toggle_float, { desc = "Open float parent directory" }),
		})
	end,
}
