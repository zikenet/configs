function sesh_sessions
    set -l session (
        sesh list --icons | fzf \
            --reverse \
            --no-sort \
            --ansi \
            --border rounded \
            --prompt '⚡  ' \
            --header '  ^a all ^o tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
            --bind 'tab:down,btab:up' \
            --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
            --bind 'ctrl-o:change-prompt(  )+reload(sesh list -t --icons)' \
            --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
            --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
            --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~/Development/ ~/.config/)' \
            --bind 'ctrl-d:execute(tmux kill-session -t {2..})+reload(sesh list --icons)'
    )

    # If nothing selected, just return
    if test -z "$session"
        commandline -f repaint
        return
    end

    commandline -f repaint
    sesh connect $session
end
