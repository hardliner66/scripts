function p
    cd ~/projects
    set file_path .
    if count $argv > /dev/null
        set file_path $argv
    end
    cd $file_path
end
