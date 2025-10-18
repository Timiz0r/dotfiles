if not status is-interactive
    return
end

function fish_greeting
    fastfetch
end

set -x EDITOR nvim
set -x PAGER 'bat --wrap never'
set -x GIT_AUTHOR_NAME Timiz0r
set -x GIT_AUTHOR_EMAIL 5377118+Timiz0r@users.noreply.github.com
set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x FZF_DEFAULT_OPTS -m --bind 'ctrl-a:select-all' --bind 'alt-a:deselect-all'
# note that default node version via nvm is set via uvars

zoxide init fish | source
zellij setup --generate-completion fish | source
monja completions | source
complete -c cht.sh -xa '(curl -s cheat.sh/:list)'

fzf_configure_bindings --variables='ctrl-alt-v'
set -x fzf_preview_dir_cmd eza -la --color=always --group-directories-first --icons