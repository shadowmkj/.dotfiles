return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },
			{ "<leader>tf", "<cmd>Trouble quickfix toggle<cr>", desc = "Toggle Trouble Quickfix" },
			{ "[t", "<cmd>TroublePrevious<cr>", desc = "Previous Trouble Item" },
			{ "]t", "<cmd>TroubleNext<cr>", desc = "Next Trouble Item" },
		},
		-- config = function()
		-- 	vim.keymap.set("n", "<leader>tt", function()
		-- 		require("trouble").toggle({mode = "diagnostics"})
		-- 	end)
		--
		-- 	vim.keymap.set("n", "<leader>tf", function()
		-- 		require("trouble").toggle({mode = "qflist"})
		-- 	end)
		--
		-- 	vim.keymap.set("n", "[t", function()
		-- 		require("trouble").next({ mode = "diagnostics", skip_groups = true, jump = true })
		-- 	end)
		--
		-- 	vim.keymap.set("n", "]t", function()
		-- 		require("trouble").previous({ mode = "diagnostics", skip_groups = true, jump = true })
		-- 	end)
		-- end,
	},
}
