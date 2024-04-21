if status is-interactive
    neofetch
end

function fish_greeting
end

alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias v 'nvim'
alias vim 'nvim'
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | egrep '^\.'"                                     # show only dotfiles
alias cat='bat --theme base16-256 --style full'
alias wtr='curl wttr.in'
starship init fish | source

