set project_path $HOME/projects
if test -n "$p_project_path"
	set project_path $p_project_path
end

set project_path (echo $project_path | sed -e "s/\/*\$//")

set paths (fd -H '(.p_project|.p_language_dir|Cargo.toml|.git|CMakeLists.txt|package.json|build.zig,.*\.pro,.*\.pri)' $project_path | rev | cut -d'/' -f2- | rev | sed -E 's!'$project_path'\/?!!' | uniq | sort)
complete -c p -x -a "$paths"
