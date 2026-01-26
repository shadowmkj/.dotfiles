return {
	"elihunter173/dirbuf.nvim",
	opts = function()
		vim.keymap.set("n", "<leader>db", ":Dirbuf<CR>", { desc = "Fzf Live Grep" })
	end,
}
