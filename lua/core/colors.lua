vim.opt.termguicolors = true

local dn = require("dark_notify")

local darkTheme = "tokyonight"
local lightTheme = "tokyonight-day"

vim.cmd.colorscheme("tokyonight")
dn.run({
    -- schemes = {
    --     dark = { colorscheme = darkTheme },
    --     light = { colorscheme = lightTheme },
    -- },
    onchange = function(mode)
        vim.cmd.colorscheme("tokyonight")
    end,
})
