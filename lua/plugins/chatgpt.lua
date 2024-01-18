require('gp').setup({
    openai_api_key = _G["OPENAI_API"],
    chat_model = {model = 'gpt-3.5-turbo-1106'},
    hooks = {
        -- example of adding command which writes unit tests for the selected code
        UnitTests = function(gp, params)
            local template =
                "I have the following code from {{filename}}:\n\n" ..
                    "```{{filetype}}\n{{selection}}\n```\n\n" ..
                    "Please respond by writing table driven unit tests for the code above."
            gp.Prompt(params, gp.Target.enew, nil, gp.config.command_model,
                      template, gp.config.command_system_prompt)
        end,
        -- example of adding command which explains the selected code
        Explain = function(gp, params)
            local template =
                "I have the following code from {{filename}}:\n\n" ..
                    "```{{filetype}}\n{{selection}}\n```\n\n" ..
                    "Please respond by explaining the code above."
            gp.Prompt(params, gp.Target.popup, nil, gp.config.command_model,
                      template, gp.config.chat_system_prompt)
        end,
        -- example of usig enew as a function specifying type for the new buffer
        CodeReview = function(gp, params)
            local template =
                "I have the following code from {{filename}}:\n\n" ..
                    "```{{filetype}}\n{{selection}}\n```\n\n" ..
                    "Please analyze for code smells and suggest improvements."
            gp.Prompt(params, gp.Target.enew("markdown"), nil,
                      gp.config.command_model, template,
                      gp.config.command_system_prompt)
        end,
        -- example of making :%GpChatNew a dedicated command which
        -- opens new chat with the entire current buffer as a context
        BufferChatNew = function(gp, _)
            -- call GpChatNew command in range mode on whole buffer
            vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        end,
        -- example of adding a custom chat command with non-default parameters
        -- (configured default might be gpt-3 and sometimes you might want to use gpt-4)
        BetterChatNew = function(gp, params)
            local chat_model = {model = "gpt-4", temperature = 0.7, top_p = 1}
            local chat_system_prompt = "You are a general AI assistant."
            gp.cmd.ChatNew(params, chat_model, chat_system_prompt)
        end

    }
})
