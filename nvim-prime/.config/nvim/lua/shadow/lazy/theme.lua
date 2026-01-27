return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"catppuccin",
				"rose-pine",
				"gruvbox",
				"tokyonight",
				"brightburn",
				"kanagawa",
				"kanagawa-dragon",
				"kanagawa-lotus",
			},
			default_theme = "catppuccin",
			live_preview = true,
		})
	end,
}
