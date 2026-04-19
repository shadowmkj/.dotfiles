function fish_greeting
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime | sed 's/^.*up  *\([^,]*\),.*/\1/' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')

	echo -e " \e[1mTodos:\e[0;32m"
	if test -s ~/todo
		set_color magenta
		cat ~/todo | sed 's/^/ /'
		echo
	end
	set_color normal
end

starship init fish | source
zoxide init --cmd cd fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"

fzf --fish | source
atuin init fish | source

set EDITOR nvim
set -Ux MANPAGER "nvim +Man! -c 'set ft=man'"

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# Replace ls with eza
alias ls='eza --icons --git'

# Long format, shows all files, with headers
alias ll='eza --long --all --header --icons --git'

alias y='yazi'

alias v='nvim'
alias ta='tmux attach'
alias lg='lazygit'
alias pms='podman machine stop'
alias pmS='podman machine start'
alias gta='cd ~/Documents/Desk/Apps'
alias hideicons='defaults write com.apple.finder CreateDesktop false'
alias showicons='defaults write com.apple.finder CreateDesktop true'
alias tf="terraform"
alias ff="fastfetch"
alias tns="tmux new-session -s (pwd | path basename)"
alias tks="tmux kill-server"
alias tls="tmux list-sessions"
alias bat="bat --theme='base16-256'"
alias lc="leetrs"
alias cg="cargo"


# Yazi cd integration
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function fish_user_key_bindings
    bind \cf 'sh /Users/milan/scripts/tmux-sessionize; commandline -f repaint'
end


# A function to list all tinty themes and select one (or cycle)
function theme
    if test "$argv[1]" = "cycle"
        tinty cycle
    else
        set themes (tinty list)
        set selected (printf '%s\n' $themes | fzf --prompt="Select a tinty theme: ")
        if test -n "$selected"
            tinty apply "$selected"
        end
    end

    # kitty @ set-colors --all /Users/milan/.local/share/tinted-theming/tinty/tinted-terminal-themes-kitty-file.conf
    tmux source-file ~/.tmux.conf 2>/dev/null
end

function apps
    set dirs (fd -t d -d 1 . ~/Documents/Desk/Apps | awk -F/ '{print $7}' | fzf)
    if test -n "$dirs"
        cd ~/Documents/Desk/Apps/$dirs
    end
end

function sudolast
    sudo (history --max=1)
end

# Added by Antigravity
fish_add_path /Users/milan/.antigravity/antigravity/bin

# LuaRocks 5.1 / Neovim paths
set -gx LUA_PATH "$HOME/.luarocks/share/lua/5.1/?.lua;$HOME/.luarocks/share/lua/5.1/?/init.lua;;"
set -gx LUA_CPATH "$HOME/.luarocks/lib/lua/5.1/?.so;;"

# Add LuaRocks binaries to your PATH
fish_add_path $HOME/.luarocks/bin
