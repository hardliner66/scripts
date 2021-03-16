# complete -c p -x -a "(find ~/projects/ -type d -exec test -e '{}/.git' ';' -print -prune | sed 's!'$HOME'/projects/!!')" 
complete -c p -x -a "(find ~/projects/ -maxdepth 3 -type d -not -path '*/\.git/*' -not -name '\.git' | sed 's!'$HOME'/projects/!!')"
