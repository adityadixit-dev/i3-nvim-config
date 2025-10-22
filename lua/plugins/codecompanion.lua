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
		"j-hui/fidget.nvim",
	},

	opts = {
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
				adapter = {
					name = "openai",
					model = "gpt-5-mini",
				},
			},
		},
		display = {
			action_palette = {
				provider = "snacks",
				opts = {
					show_default_actions = true,
					show_default_prompt_library = true,
					title = "Code Companion Actions",
				},
			},
			chat = {
				window = {
					width = 0.40,
				},
				fold_context = true,
			},
		},
		prompt_library = {
			["Syntax Helper"] = require("plugins.codecompanion.prompts.language-syntax"),
		},
	},

	init = function()
		require("plugins.codecompanion.fidget-spinner"):init()
	end,
}
