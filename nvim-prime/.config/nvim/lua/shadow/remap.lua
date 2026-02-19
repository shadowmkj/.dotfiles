vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Quick Save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>q", "<cmd>:q<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>K", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>Xx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>!lcode submit %<CR>") -- submit to leetcode
vim.keymap.set("n", "<leader>tt", "<cmd>:Themery<CR>")
vim.keymap.set("n", "<leader>lr", "<cmd>:LiveRun<CR>")

-- Toggle Github Copilot
vim.keymap.set("n", "<leader>cc", function()
	local status = vim.g.copilot_enabled
	vim.g.copilot_enabled = not status
	print("Github Copilot: " .. (vim.g.copilot_enabled and "Enabled" or "Disabled"))
end)

-- wrap
vim.keymap.set("n", "<leader>uw", function()
	vim.wo.wrap = not vim.wo.wrap
end)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("i", "jk", "<Esc>")

-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bn<cr>")
vim.keymap.set("n", "<leader>m", "ct_")

-- -- I want to switch between colorschemes easily and also preview it live
-- vim.keymap.set("n", "<leader>tt", function()
-- 	-- Also live preview the colorscheme as we select it
--
-- 	local themes = vim.fn.getcompletion("", "color")
-- 	local current_theme = vim.g.colors_name
-- 	vim.ui.select(themes, { prompt = "Select Colorscheme" }, function(choice)
-- 		if choice ~= "" then
-- 			vim.cmd("colorscheme " .. choice)
-- 		else
-- 			-- If no choice is made, revert to the original theme
-- 			vim.cmd("colorscheme " .. current_theme)
-- 		end
-- 	end)
-- end, { desc = "Select Colorscheme" })
