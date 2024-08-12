local NuxtMigrate = require("plugins.chatgpt.hooks.nuxt-migrate")
local NuxtMigratePlain = require("plugins.chatgpt.hooks.nuxt-migrate-plain")
local BetterChat = require("plugins.chatgpt.hooks.better-chat")

require("gp").setup({
    openai_api_key = _G["OPENAI_API"],
    agents = {
        {
            provider = "openai",
            name = "ChatGPT3-5",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
            provider = "openai",
            name = "CodeGPT3-5",
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-3.5-turbo", temperature = 0.8, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").code_system_prompt,
        },
    },
    hooks = {
        NuxtMigrate = NuxtMigrate,
        NuxtMigrateSimple = NuxtMigratePlain,
        BetterChat = BetterChat,
    },
})
