return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['a"'] = { query = "@string.outer", desc = "Select outer part of a string" },
						['i"'] = { query = "@string.inner", desc = "Select inner part of a string" },
						["a'"] = { query = "@string.outer", desc = "Select outer part of a string" },
						["i'"] = { query = "@string.inner", desc = "Select inner part of a string" },
						["a`"] = { query = "@string.outer", desc = "Select outer part of a backtick string" },
						["i`"] = { query = "@string.inner", desc = "Select inner part of a backtick string" },
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']f'] = { query = "@function.outer", desc = "Next function start" },
						[']c'] = { query = "@class.outer", desc = "Next class start" },
					},
					goto_next_end = {
						[']F'] = { query = "@function.outer", desc = "Next function end" },
						[']C'] = { query = "@class.outer", desc = "Next class end" },
					},
					goto_previous_start = {
						['[f'] = { query = "@function.outer", desc = "Previous function start" },
						['[c'] = { query = "@class.outer", desc = "Previous class start" },
					},
					goto_previous_end = {
						['[F'] = { query = "@function.outer", desc = "Previous function end" },
						['[C'] = { query = "@class.outer", desc = "Previous class end" },
					},
				},
			},

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = { "markdown" },
			},
		})
	end,
}
