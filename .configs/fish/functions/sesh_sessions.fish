function sesh_sessions
    set -l session (
        sesh list --icons | fzf  \
            --reverse \
            --no-sort \
            --ansi \
            --border rounded \
            --prompt '⇒  ' \
            --bind 'tab:down,btab:up' \
            --bind 'ctrl-a:change-prompt(⇒  )+reload(sesh list --icons)' \
            --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~/Developments/ ~/.config/)' \
            --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)'
    )

    # If nothing selected, just return
    if test -z "$session"
        commandline -f repaint
        return
    end

    commandline -f repaint
    sesh connect $session
end
