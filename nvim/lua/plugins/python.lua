return {
	{ import = "lazyvim.plugins.extras.lang.python" },
	{
		"conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "ruff_format" },
			},
		},
	},
}