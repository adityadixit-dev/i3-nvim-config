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
		strategies = {

			chat = { adapter = "openai", model = "gpt-5-codex" },
			inline = { adapter = "openai", model = "gpt-5-codex" },
		},
	},
}
