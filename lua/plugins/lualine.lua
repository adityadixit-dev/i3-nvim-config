return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = "tokyonight",
			},
			sections = {
				lualine_b = { "filename" },
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = {
					{ "filetype" },
				},
				lualine_y = {
					{
						-- require("minuet.lualine"),
						-- the follwing is the default configuration
						-- the name displayed in the lualine. Set to "provider", "model" or "both"
						-- display_name = "model",
						-- separator between provider and model name for option "both"
						-- provider_model_separator = ':',
						-- whether show display_name when no completion requests are active
						-- display_on_idle = false,
					},
				},
			},
		})
	end,
}
