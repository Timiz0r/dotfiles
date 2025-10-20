if not status is-interactive
    return
end

function fish_greeting
    #  set -l activity (kde_activity)
    #
    #  if test $TERM_PROGRAM = "vscode"
    #      fastfetch -c ~/.config/fastfetch/config-vscode.jsonc
    #      return
    #  end
    #
    #  if test $activity = "Work"
    #      fastfetch -c ~/.config/fastfetch/config-private.jsonc
    #  else
    #      fastfetch
    #  end
    fastfetch
end

set -x EDITOR nvim
set -x PAGER 'bat --wrap never'
set -x GIT_AUTHOR_NAME Timiz0r
set -x GIT_AUTHOR_EMAIL 5377118+Timiz0r@users.noreply.github.com
set -x GCM_CREDENTIAL_STORE gpg
set -x GTK_USE_PORTAL 1
set -x FZF_DEFAULT_COMMAND rg --files
set -x FZF_DEFAULT_OPTS -m --bind 'ctrl-a:select-all' --bind 'alt-a:deselect-all'
# note that default node version via nvm is set via uvars

zoxide init fish | source
rustup completions fish | source
zellij setup --generate-completion fish | source
monja completions | source
complete -c cht.sh -xa '(curl -s cheat.sh/:list)'
pnpm completion fish >~/.config/fish/completions/pnpm.fish

fzf_configure_bindings --variables='ctrl-alt-v'
set -x fzf_preview_dir_cmd eza -la --color=always --group-directories-first --icons

# stuff to maybe convert later
# alias ppls='kill -9 plasmashell'

# alias unity='env GDK_SCALE=2 GDK_DPI_SCALE=0.5 ~/Unity/Hub/Editor/6000.0.42f1/Editor/Unity'
# alias alcom='WEBKIT_DISABLE_DMABUF_RENDERER=1 ALCOM &>/dev/null &; disown'

# alias affinity-run='rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine $1'
# rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine affinity-photo-msi-2.5.7.exe

# function _start_execute
#     if test -e start.sh
#         ./start.sh
#     else
#         echo 'No start.sh found.'
#         return 1
#     end
#     # for reasons unknown, the repaint on keybind causes the last line to disappear
#     echo
# end
# bind f5 _start_execute repaint
