function vc
    pushd ~/scripts
    set file_path .
    if count $argv > /dev/null
        set file_path $argv
    end
    nvim $file_path && ~/scripts/update.sh
    popd
end
