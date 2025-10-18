function mkcd --wraps='mkdir -p $argv && cd' --description 'alias mkcd=mkdir -p $argv && cd'
  mkdir -p $argv && cd $argv
        
end
