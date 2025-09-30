return {
	"David-Kunz/gen.nvim",
	keys = {

		{
			"<leader>mm",
			":Gen Chat<cr>",
			desc = "Chat with AI",
			mode = { "n", "v" },
		},
		{
			"<leader>ma",
			":Gen Ask<cr>",
			desc = "Ask about Text or File",
			mode = { "n", "v" },
		},

		{
			"<leader>ms",
			":Gen Summarize<cr>",
			desc = "Summarize Selected Text",
			mode = { "v" },
		},

		{
			"<leader>mr",
			":Gen Review_Code<cr>",
			desc = "Review Code",
			mode = { "n", "v" },
		},
	},
	opts = {
		model = "deepseek-coder-v2:latest", -- The default model to use.
		quit_map = "q", -- set keymap to close the response window
		retry_map = "<c-r>", -- set keymap to re-send the current prompt
		accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
		host = "localhost", -- The host running the Ollama service.
		port = "11434", -- The port on which the Ollama service is listening.
		display_mode = "vertical-split", -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
		show_prompt = true, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
		show_model = true, -- Displays which model you are using at the beginning of your chat session.
		no_auto_close = false, -- Never closes the window automatically.
		file = true, -- Write the payload to a temporary file to keep the command short.
		hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
		body = { model = "qwen3:8b-q8_0", stream = true, keep_alive = "20m", options = { num_ctx = 16384 } },
		init = function(options)
			pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
		end,
		-- Function to initialize Ollama
		command = function(options)
			local body = { model = options.model, stream = true, keep_alive = "20m" }
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
	},
}
