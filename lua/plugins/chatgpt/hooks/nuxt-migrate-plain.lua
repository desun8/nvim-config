function NuxtMigratePlain(gp, params)
    local template = "I have the following code from {{filename}}:\n\n"
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
        .. "Rewrite the code in vue 3. The order of SFC is as follows: script (use setup and ts), template and style (if exist). If the template has a component name in kebab-case, change it to PascalCase and use self-closure."
    local agent = {
        name = "CodeGPT4o",
        chat = false,
        command = true,
        -- string with model name or table with model name and parameters
        model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
        -- system prompt (use this to specify the persona/role of the AI)
        system_prompt = "You are an AI working as a code editor.\n\n"
            .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
            .. "START AND END YOUR ANSWER WITH:\n\n```",
    }
    gp.Prompt(params, gp.Target.enew, nil, agent.model, template, agent.system_prompt)
end

return NuxtMigratePlain;
