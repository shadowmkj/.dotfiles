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

function fish_mode_prompt
end


# function fish_prompt
# 	set_color brblack
# 	echo -n "["(date "+%H:%M")"] "
# 	set_color blue
# 	if [ $PWD != $HOME ]
# 		set_color brblack
# 		set_color yellow
# 		echo -n (basename $PWD)
# 	end
# 	set_color green
# 	printf '%s ' (__fish_git_prompt)
# 	set_color red
# 	echo -n '| '
# 	set_color normal
# end
starship init fish | source
zoxide init --cmd cd fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"

atuin init fish | source

set EDITOR nvim

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

alias vim='nvim'
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


# A function to list all tinty themes and select one
function theme
    set themes (tinty list)
    set selected (printf '%s\n' $themes | fzf --prompt="Select a tinty theme: ")
    if test -n "$selected"
        tinty apply "$selected"
    end
    # kitty @ set-colors --all /Users/milan/.local/share/tinted-theming/tinty/tinted-terminal-themes-kitty-file.conf
    tmux source-file ~/.tmux.conf 2>/dev/null
end
