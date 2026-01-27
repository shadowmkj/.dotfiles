local transparent_bg = true
function ColorMyPencils(color)
	if color ~= nil then
		color = "rose-pine"
		vim.cmd.colorscheme(color)
	end
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = transparent_bg,
				transparent_mode = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = transparent_bg and "transparent" or "dark",
					floats = transparent_bg and "transparent" or "dark",
				},
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				terminal_colors = true,
				enable = {
					terminal = true,
					background = false,
				},
				styles = {
					transparency = true,
				},
			})

			-- vim.cmd("colorscheme rose-pine")

			-- ColorMyPencils()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
}
