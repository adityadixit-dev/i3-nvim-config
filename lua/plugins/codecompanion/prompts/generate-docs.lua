return {
	interaction = "chat",
	description = "Generate Documentation",
	opts = {
		modes = { "v", "n" },
		alias = "docs",
		auto_submit = true,
		user_prompt = false,

		adapter = {
			name = "openai",
			model = "gpt-5-nano",
		},
	},
	prompts = {
		{
			role = "system",
			content = function(context)
				return "I want you to act as a senior "
					.. context.filetype
					.. " developer. You are required to generate documentation relevant to the given buffer"
					.. "Follow the steps highlighted below"
					.. "1. Identify the language and use the relevant standard for documentation"
					.. "2. Very briefly explain the parameters, if any"
					.. "3. There is no need to include the original code in the reply. Only provide the documentation"
					.. "4. For example if the code is JS or TS the documention should follow JS Docs standards"
					.. "5. The buffer is "
					.. context.bufnr
			end,
		},
		{
			role = "user",
			content = function(context)
				if context.is_visual then
					local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
					return "Generate documentations for the following:\n\n" .. text
				else
					return "Generate Documentation for #{buffer}"
				end
			end,
			opts = {
				contains_code = true,
			},
		},
	},
}
