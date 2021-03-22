function p
	set last_dir (pwd)
	cd ~/projects
	set file_path .
	if count $argv > /dev/null
		set file_path $argv
	end
	cd $file_path
	if test $status -ne 0
		cd $last_dir
	end
end
