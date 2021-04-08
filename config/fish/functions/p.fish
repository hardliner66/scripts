function p
	set project_path $HOME/projects
	if test -n "$p_project_path"
		set project_path $p_project_path
	end

	set last_dir (pwd)
	set file_path .
	if count $argv > /dev/null
		set file_path $argv
	end
	set file_path "$project_path/$file_path"
	cd $file_path
	if test $status -ne 0
		cd $last_dir
	end
end
