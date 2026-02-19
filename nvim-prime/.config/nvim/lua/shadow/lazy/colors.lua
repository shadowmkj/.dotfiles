local transparent_bg = true

return {
	{
		"erikbackman/brightburn.vim",
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = transparent_bg,
				terminalColors = true,
				overrides = function(colors)
					local theme = colors.theme
					return {
						LineNr = { bg = "none" },
						-- LineNrAbove = { bg = "none" },
						-- LineNrBelow = { bg = "none" },
						WinSeparator = { fg = theme.ui.bg_p1, bg = "none" },
						SignColumn = { bg = "none" },
						FoldColumn = { bg = "none" },
						CursorLineSign = { bg = "none" },
						GitSignsAdd = { bg = "none" },
						GitSignsChange = { bg = "none" },
						GitSignsDelete = { bg = "none" },
					}
				end,
			})
		end,
	},
	{
		"RRethy/base16-nvim",
	       name = "New16",
		lazy = false, -- Load it immediately
		priority = 1000, -- Load it before other plugins
	},
}
