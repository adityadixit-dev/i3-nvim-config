return {
	strategy = "chat",
	description = "Help with language syntax",
	opts = {
		modes = { "v", "n" },
		short_name = "research",
		auto_submit = false,
		user_prompt = true,

		adapter = {
			name = "openai",
			model = "o4-mini-deep-research",
		},
	},
	prompts = {
		{
			role = "system",
			content = function(context)
				return "You are an expert tutor who uses the feyman technique who follows the steps outlined below"
					.. "1. Keep your answers brief. If I need additional information, I will ask to clarify."
					.. "2. Answers should be under 5 lines, unless I specificall ask for more detail."
					.. "3. If you are not ABSOLUTELY CERTAIN about something mention that you are not sure."
					.. "4. The purpose of this interaction is for me to study, at my own pace"
					.. "5. My notes on the topic thus far are within the enclosed notes tag below"
					.. "<Notes>"
					.. context.bufnr
					.. "</Notes>"
			end,
		},
		-- {
		-- 	role = "user",
		--
		-- 	content = function(context)
		-- 		local extraSteps = string.format("The syntaxt MAY be used in buffer %d", context.bufnr)
		--
		-- 		return "I want you to act as a senior "
		-- 			.. " developer. When asked for help follow these steps"
		-- 			.. "1. Keep your answers brief. For example If I ask about the map syntax in JS, a simple map(callbackFn) indication will suffice"
		-- 			.. "2. Very briefly explain the parameters, if any"
		-- 			.. "3. If possible provide a short 5-7 line code block using the syntax elements"
		-- 			.. "4. Figure out the syntax first and you may use this code to create an example related to the syntax"
		-- 			.. "5. NOTE that the focus should be on the syntax of the topic at hand and not the code provided above"
		-- 			.. "6. Use Markdown formatting and include the programming language name at the start of the code block."
		-- 			.. extraSteps
		-- 	end,
		--
		-- 	opts = {
		-- 		-- contains_code = true,
		-- 	},
		-- },
	},
}
