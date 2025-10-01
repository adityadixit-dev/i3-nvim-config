return {
	"David-Kunz/gen.nvim",
	keys = {
		{
			"<leader>ma",
			":Gen Ask<cr>",
			desc = "Ask about Text or File",
			mode = { "n", "v" },
		},
		{
			"<leader>mr",
			":Gen Review_Code<cr>",
			desc = "Review Code",
			mode = { "n", "v" },
		},
	},
	opts = {
		model = "qwen3:8b-q8_0", -- The default model to use.
		quit_map = "q", -- set keymap to close the response window
		retry_map = "<c-r>", -- set keymap to re-send the current prompt
		accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
		host = "localhost", -- The host running the Ollama service.
		port = "11434", -- The port on which the Ollama service is listening.
		display_mode = "vertical-split", -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
		show_prompt = true, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
		show_model = true, -- Displays which model you are using at the beginning of your chat session.
		no_auto_close = true, -- Never closes the window automatically.
		file = false, -- Write the payload to a temporary file to keep the command short.
		hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
		body = { model = "qwen3:8b-q8_0", stream = true, keep_alive = "10m", options = { num_ctx = 16384 } },
		init = function(options)
			pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
		end,
		-- Function to initialize Ollama
		command = function(options)
			local body = { model = options.model, stream = true, keep_alive = "10m" }
			return "curl --silent --no-buffer -X POST http://"
				.. options.host
				.. ":"
				.. options.port
				.. "/api/chat -d $body"
		end,
		-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
		-- This can also be a command string.
		-- The executed command must return a JSON object with { response, context }
		-- (context property is optional).
		-- list_models = '<omitted lua function>', -- Retrieves a list of model names
		result_filetype = "markdown", -- Configure filetype of the result buffer
		debug = false, -- Prints errors and the command which is run.
		prompts = {
			Review_Code = {
				prompt = [[
        - You are an expert in $filetype and frameworks related to it.
        - Review the code attached at the end of this message.
        - If you are unsure about language/framework/context, state that you cannot help.
        - If A certain part of the code is already good, there is no need to comment on it.
        - While explaining issues break the code into smaller chunks and analyze each chunk seperately.
        - Do Not Ramble on and output a whole bunch of code for the sake of it.
        - There is no need to point out the positives. Only return areas where the code can be improved
        - The code to review  is: \n$text
      ]],
			},
			Ask = {
				prompt = [[
        - You are an expert in $filetype and frameworks related to it.
        - If you are unsure about language/framework/context, state that you cannot help.
        - Be concise. If you have multiple points break them into smaller sections.Do Not RAMBLE. 
        - If I am asking for syntax or what inbuilt function or method to use, provide and example. but keep it brief.
        - $input
        - The surrounding code for additional context is :\n$text
        ]],
			},
		},
	},
}
