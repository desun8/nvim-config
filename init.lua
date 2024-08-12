-- BASIC
require("core.env")
require("core.plugins")
require("core.configs")
require("core.mappings")
require("core.colors")

-- PLUGINS
-- UI
require('plugins.dark-notify')
require("plugins.devicons")
require("plugins.nvimtree")
require("plugins.lualine")
require('plugins.session')
require('plugins.colorizer')
-- require("plugins.dashboard")
-- require("plugins.bufferline")
-- require("plugins.whichkey")

-- Code
require("plugins.mason")
require("plugins.treesitter")
require("plugins.lsp.index")
require("plugins.cmp")
require("plugins.nullls")
-- require("plugins.neodev") -- helper for lua config (deprecated) - new version lazydev.nvim

-- Git
require("plugins.gitsigns")
require("plugins.diffview")

-- AI
require("plugins.chatgpt.index")
-- require('plugins.copilot')

-- Utils
-- require("plugins.autopairs")
-- require("plugins.autotag")
-- require("plugins.surround")
require("plugins.comment")
