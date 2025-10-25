return {
	"Exafunction/windsurf.vim",
	event = "BufEnter",
	config = function()
		vim.g.codeium_manual = 1
		vim.g.codeium_disable_bindings = 1

		vim.keymap.set("n", "<leader>ts", function()
			vim.g.codeium_manual = vim.g.codeium_manual == 0 and 1 or 0
		end, { desc = "[T]oggle Auto [S]uggesting" })

		vim.keymap.set("i", "<Tab>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-k>", function()
			return vim.fn["codeium#AcceptNextWord"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-l>", function()
			return vim.fn["codeium#AcceptNextLine"]()
		end, { expr = true, silent = true })
	end,
}
