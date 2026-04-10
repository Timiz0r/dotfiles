function fish_greeting
    set -l activity (kde_activity)

    if test $TERM_PROGRAM = "vscode"
        fastfetch -c ~/.config/fastfetch/config-vscode.jsonc
        return
    end

    if test $activity = "Work"
        fastfetch -c ~/.config/fastfetch/config-private.jsonc
    else
        fastfetch
    end
end
