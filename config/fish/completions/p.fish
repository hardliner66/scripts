complete -c p -x -a "(find ~/projects/ -maxdepth 2 -not -path '*/\.git/*' -not -name '\.git' | sed 's!'$HOME'/projects/!!')" 
