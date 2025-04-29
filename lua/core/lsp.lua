vim.lsp.config("*", {
	root_markers = { ".git" },
})
-- TODO: итерировать файлы в ./lsp чтобы не активировать каждый сервер ручками
vim.lsp.enable("lua_ls")
vim.lsp.enable("html")
vim.lsp.enable("css")
vim.lsp.enable("ts")
vim.lsp.enable("vue")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition", silent = true })
	end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
