return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>xj", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },
			{ "<leader>xk", "<cmd>Trouble quickfix toggle<cr>", desc = "Toggle Trouble Quickfix" },
			{ "gd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "Toggle Go to Definition" },
			{ "[t", "<cmd>TroublePrevious<cr>", desc = "Previous Trouble Item" },
			{ "]t", "<cmd>TroubleNext<cr>", desc = "Next Trouble Item" },
		},
	},
}
