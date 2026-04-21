-- Universal theming for neovim

local default_theme = "base16-gruvbox-dark-hard"

local function get_tinty_theme()
    local theme_name = vim.fn.system("tinty current &> /dev/null && tinty current")

    if vim.v.shell_error ~= 0 then
        return default_theme
    else
        return vim.trim(theme_name)
    end
end

local function main()
    vim.o.termguicolors = true
    vim.g.tinted_colorspace = 256
    local current_theme_name = get_tinty_theme()

    vim.cmd("colorscheme " .. current_theme_name)
    -- Make main UI transparent
    vim.cmd([[
       highlight Normal guibg=NONE ctermbg=NONE
       highlight NormalNC guibg=NONE ctermbg=NONE
     ]])
end

main()
