local formatters = { "stylua", "prettierd" }

return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			-- Автоустановка форматтеров
			require("utils.mason-installer").install_packages(formatters, "formatter")

			require("conform").setup({
				notify_on_error = false,
				-- format_on_save = function(bufnr)
				-- 	-- Disable "format_on_save lsp_fallback" for languages that don't
				-- 	-- have a well standardized coding style. You can add additional
				-- 	-- languages here or re-enable it for the disabled ones.
				-- 	local disable_filetypes = { c = true, cpp = true }
				-- 	if disable_filetypes[vim.bo[bufnr].filetype] then
				-- 		return nil
				-- 	else
				-- 		return {
				-- 			timeout_ms = 500,
				-- 			lsp_format = "fallback",
				-- 		}
				-- 	end
				-- end,
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform can also run multiple formatters sequentially
					-- python = { "isort", "black" },
					--
					-- You can use 'stop_after_first' to run the first available formatter from the list
					javascript = { "prettierd", stop_after_first = true },
					typescript = { "prettierd", stop_after_first = true },
					vue = { "prettierd", stop_after_first = true },
				},
			})
		end,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
	},
}
