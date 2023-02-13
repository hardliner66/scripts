complete -c vc -x -a "(find ~/scripts/ -not -path '*/\.git/*' -not -name '\.git' | sed 's!'$HOME'/scripts/!!')" 
