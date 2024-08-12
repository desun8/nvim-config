function BetterChat(gp, params)
    --  local agent = {
    --     name = "CodeGPT4o",
    --     -- chat = false,
    --     -- command = true,
    --     -- string with model name or table with model name and parameters
    --     model = { model = "gpt-4o", temperature = 0.7, top_p = 1 },
    --     -- system prompt (use this to specify the persona/role of the AI)
    --     system_prompt = "You are a general AI assistant.",
    -- }
    -- gp.Prompt(params, gp.Target.enew, nil, agent.model, nil, agent.system_prompt)
    
    local chat_model = { model = "gpt-4o", temperature = 0.7, top_p = 1 }
    local chat_system_prompt = "You are a general AI assistant."
    gp.cmd.ChatNew(params, chat_model, chat_system_prompt)
end

return BetterChat
