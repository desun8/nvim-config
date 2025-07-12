vim.lsp.config("*", {
	root_markers = { ".git" },
})
-- Автоустановка серверов из папки lsp/
local function auto_install_and_enable()
	-- Включаем серверы из папки lsp/
	local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
	local files = vim.fn.glob(lsp_dir .. "/*.lua", false, true)
	
	for _, file in ipairs(files) do
		local server_name = vim.fn.fnamemodify(file, ":t:r")
		
		-- Пропускаем файлы, начинающиеся с подчеркивания
		if not server_name:match("^_") then
			-- Устанавливаем серверы
			require("utils.mason-installer").install_packages(server_name, 'lsp')
			vim.lsp.enable(server_name)
		end
	end
end

-- Запускаем после загрузки Mason
vim.defer_fn(auto_install_and_enable, 100)

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
