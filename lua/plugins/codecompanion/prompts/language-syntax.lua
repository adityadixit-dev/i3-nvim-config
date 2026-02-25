return {
	interaction = "chat",
	description = "Help with language syntax",
	opts = {
		modes = { "v", "n" },
		alias = "syntax",
		auto_submit = true,
		user_prompt = true,

		adapter = {
			name = "openai",
			model = "gpt-5-mini",
		},
	},
	prompts = {
		{
			role = "system",
			content = function(context)
				local extraSteps = string.format("The syntax MAY be used in buffer %d", context.bufnr)

				return "I want you to act as a senior "
					.. context.filetype
					.. " developer. When asked for help follow these steps"
					.. "1. Keep your answers brief. For example If I ask about the map syntax in JS, a simple map(callbackFn) indication will suffice"
					.. "2. Very briefly explain the parameters, if any"
					.. "3. If possible provide a short 5-7 line code block using the syntax elements"
					.. "4. Figure out the syntax first and you may use this code to create an example related to the syntax"
					.. "5. NOTE that the focus should be on the syntax of the topic at hand and not the code provided above"
					.. "6. Use Markdown formatting and include the programming language name at the start of the code block."
					.. extraSteps
			end,
		},
		-- {
		-- 	role = "user",
		-- 	content = function(context)
		-- 		return "The Following code is where I MAY be looking to implement requested syntax" .. code
		-- 	end,
		-- 	opts = {
		-- 		contains_code = true,
		-- 	},
		-- },
	},
}
