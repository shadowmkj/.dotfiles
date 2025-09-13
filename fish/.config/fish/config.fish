starship init fish | source
zoxide init --cmd cd fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"

# Replace ls with eza
alias ls='eza --icons --git'

# Long format, shows all files, with headers
alias ll='eza --long --all --header --icons --git'

alias y='yazi'
