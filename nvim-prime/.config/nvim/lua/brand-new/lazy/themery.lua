return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		local colors = vim.fn.getcompletion("", "color")

		-- Convert to themery format
		local all_themes = {}
		for _, name in ipairs(colors) do
			table.insert(all_themes, {
				name = name,
				colorscheme = name,
			})
		end

		require("themery").setup({
			themes = all_themes,
			default_theme = "kanagawa-dragon",
			live_preview = true,
		})
	end,
}
