return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
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

		interactions = {
			chat = {
				adapter = { name = "opencode" },
				-- adapter = {
				-- 	name = "openai",
				-- 	model = "gpt-5-mini",
				-- },
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
					title = "Code Companion Actions",
				},
			},
			chat = {
				window = {
					width = 0.40,
				},
				auto_scroll = true,
				show_token_count = true,

				fold_context = false,
				fold_reasoning = false,
				show_reasoning = true,
				show_settings = false,
				-- show_settings = true,
				start_in_insert_mode = true,
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
