starship init fish | source
zoxide init --cmd cd fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Yazi cd integration
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
