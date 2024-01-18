local function loadEnvFile(filePath)
    local file = io.open(filePath, "r") -- Open the file for reading
    if not file then
        return
    end

    for line in file:lines() do
        if line:match("%S") and not line:match("^#") then -- Ignore empty lines and comments
            local key, value = line:match("([^=]+)=([^=]+)")
            if key and value then
                _G[key] = value -- Set in the global environment
            end
        end
    end

    file:close()
end

-- Load the .env file (adjust the path as necessary)
loadEnvFile("/Users/evgeniy/.config/nvim/.env")
