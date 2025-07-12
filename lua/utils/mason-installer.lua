local M = {}

-- Универсальная функция установки пакетов через Mason
function M.install_packages(packages, tool_type)
	local mason_registry = require("mason-registry")
	
	-- Нормализуем входные данные в таблицу
	local package_list = type(packages) == "table" and packages or {packages}
	
	for _, package_name in ipairs(package_list) do
		if mason_registry.has_package(package_name) then
			local package = mason_registry.get_package(package_name)
			if not package:is_installed() then
				print("Installing " .. (tool_type or "") .. ": " .. package_name)
				package:install():once("closed", function()
					if package:is_installed() then
						print("✓ Successfully installed: " .. package_name)
					else
						print("✗ Failed to install: " .. package_name)
					end
				end)
			end
		else
			print("✗ Package not found in Mason: " .. package_name)
		end
	end
end

-- Функция для автоустановки LSP из папки lsp/
function M.autoinstall_lsp()
	local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
	
	if vim.fn.isdirectory(lsp_dir) == 0 then
		return
	end
	
	local files = vim.fn.glob(lsp_dir .. "/*.lua", false, true)
	local packages = {}
	
	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		
		-- Пропускаем файлы, начинающиеся с подчеркивания
		if not filename:match("^_") then
			table.insert(packages, filename)
		end
	end
	
	if #packages > 0 then
		M.install_packages(packages, "LSP server")
	end
end

return M