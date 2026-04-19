return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter").setup({})
        require("nvim-treesitter").install({
            "vimdoc",
            "javascript",
            "typescript",
            "c",
            "cpp",
            "lua",
            "jsdoc",
            "bash",
            "markdown",
            "markdown_inline",
            "rust"
        })
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- Disable treesitter for rust
                if vim.bo[args.buf].filetype == "rust" then
                    return
                end

                -- Auto-attach Treesitter highlighting
                pcall(vim.treesitter.start, args.buf)

                -- Optional: Enable Treesitter indentation
                vim.bo[args.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
            end,
        })
    end,

}
