return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local autotag = require("nvim-ts-autotag")
		autotag.setup({
			aliases = {
				["tsx"] = "html",
				["jsx"] = "html",
			},
		})
	end,
}
