return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = { style = "night" },
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
