vim.opt.termguicolors = true

local dn = require('dark_notify')

local darkTheme = "tokyonight"
local lightTheme = "tokyonight-day"

dn.run({
    schemes = {
        dark = {colorscheme = darkTheme},
        light = {colorscheme = lightTheme}
    }
})
