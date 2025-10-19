function reveal
    if test (count $argv) -eq 0
        xdg-open .
        return 1
    end
    # xdg-open "$(dirname "$1")"
    dolphin --new-window --select "$(realpath $argv[1])" 2>&1 > /dev/null &; disown
end
