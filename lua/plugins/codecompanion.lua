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
		adapters = {
			acp = {
				codex = function()
					return require("codecompanion.adapters").extend("codex", {
						defaults = {
							auth_method = "openai-api-key", -- "openai-api-key"|"codex-api-key"|"chatgpt"
							model = "gpt-5.1-codex-mini",
						},
					})
				end,
			},
		},

		interactions = {
			chat = {
				adapter = {
					name = "codex",
					model = "gpt-5.1-codex-mini",
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
				width = 95,
				height = 10,
				provider = "snacks",

				opts = {
					show_preset_actions = true,
					show_preset_prompts = true,
					show_prompt_library_builtins = true,
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
			["Personal Research"] = require("plugins.codecompanion.prompts.personal-research"),
			["Write Docs"] = require("plugins.codecompanion.prompts.generate-docs"),
		},
	},

	init = function()
		require("plugins.codecompanion.fidget-spinner"):init()
	end,
}
