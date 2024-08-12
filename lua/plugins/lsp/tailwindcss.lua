local function tailwindcss_config_exists()
    local files = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts", "tailwind.config.json" }
    for _, file in ipairs(files) do
        if vim.fn.filereadable(file) == 1 then
            return true
        end
    end
    return false
end

if tailwindcss_config_exists() then
    require("lspconfig").tailwindcss.setup({})
end
