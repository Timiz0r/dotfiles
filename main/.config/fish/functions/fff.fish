function fff --wraps='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"' --description 'alias fff=fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
  fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" $argv
        
end
