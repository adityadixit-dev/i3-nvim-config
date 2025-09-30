return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
		{
			"echasnovski/mini.diff",
			config = function()
				local diff = require("mini.diff")
				diff.setup({
					-- Disabled by default
					source = diff.gen_source.none(),
				})
			end,
		},
	},

	opts = {
		adapters = {
			http = {
				deepseek = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "deepseek", -- Give this adapter a different name to differentiate it from the default ollama adapter
						opts = {
							vision = false,
							stream = true,
						},
						schema = {
							model = {
								default = "deepseek-coder-v2:latest",
							},
							num_ctx = {
								default = 16384,
							},
							think = {
								default = true,
							},
							keep_alive = {
								default = "20m",
							},
						},
					})
				end,

				qwen3 = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "qwen3", -- Give this adapter a different name to differentiate it from the default ollama adapter
						opts = {
							vision = false,
							stream = true,
						},
						schema = {
							model = {
								default = "qwen3:8b-q8_0",
							},
							num_ctx = {
								default = 16384,
							},
							think = {
								default = true,
							},
							keep_alive = {
								default = "20m",
							},
						},
					})
				end,
			},
		},
		strategies = {
			chat = {
				adapter = {
					name = "openai",
					model = "gpt-5-nano",
				},
			},
			inline = {
				adapter = {
					name = "openai",
					model = "gpt-5-mini",
				},
			},
			cmd = {
				adapter = "qwen3",
			},
		},
		display = {
			action_palette = {
				provider = "snacks",
				opts = {
					show_default_actions = false,
					show_default_prompt_library = false,
					title = "Code Companion Actions",
				},
			},
			chat = {
				window = {
					width = 0.37,
				},
				fold_context = false,
			},
		},
	},
}
