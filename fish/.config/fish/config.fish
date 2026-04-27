source /usr/share/cachyos-fish-config/cachyos-config.fish

if status is-interactive
    starship init fish | source
    zoxide init fish | source
end

# OpenClaw Completion
source "/home/miguelgrilo/.openclaw/completions/openclaw.fish"
