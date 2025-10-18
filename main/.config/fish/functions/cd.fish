function cd --wraps=z --description 'alias cd=z'
  if not isatty stdin
    read -f argv
  end
  
  z $argv
  
end
