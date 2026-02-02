starship init fish | source
zoxide init --cmd cd fish | source

atuin init fish | source

set EDITOR nvim

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



# Yazi cd integration
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# function fish_user_key_bindings
#     bind \cf 'sh /Users/milan/scripts/tmux-sessionize; commandline -f repaint'
# end
