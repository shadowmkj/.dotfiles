if true then
    return {}
end
return {
	"nvim-mini/mini.cursorword",
	version = "*",
	opts = function()
		require("mini.cursorword").setup()
	end,
}
