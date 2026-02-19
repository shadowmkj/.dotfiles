if true then
    return {}
end
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
				"base16-gruvbox-dark-hard",
			},
			default_theme = "kanagawa-dragon",
			live_preview = true,
		})
	end,
}
