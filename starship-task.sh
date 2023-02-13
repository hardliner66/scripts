#!/bin/bash
base_dir=$(dirname "${BASH_SOURCE[0]}")
no_active_tasks="[No active task]"
export TASKRC=~/.trackwarrior-docker/.taskrc
export TASKDATA=~/.trackwarrior-docker/.task 
output=$(unbuffer task starship-project 2> /dev/null || echo "$no_active_tasks")
project=$(echo "$output" | head -5 | tail -1 | sed "s/No matches./$no_active_tasks/" | xargs)
echo "$project"
