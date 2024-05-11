# well...
function __custom_init__
    set --export CUSTOM_PATH (dirname (status -f))

    # load profile
    test -r "$CUSTOM_PATH/profile.fish" &&
    source "$CUSTOM_PATH/profile.fish" ||
    echo "cannot source $CUSTOM_PATH/profile.fish"

    function import_module
        for _module_idx in $argv[1..-1]
            if test -d "$CUSTOM_PATH/$_module_idx"
                set module_fullpath "$CUSTOM_PATH/$_module_idx"
                if test -r "$module_fullpath/init.fish"
                    set module_file_path "$module_fullpath/init.fish"
                else
                    echo "cannot load module $_module_idx, init.fish not found"
                end
            else
                echo "cannot load module $_module_idx, dir not readable"
            end
            source "$module_file_path" || "cannot load module $module_file_path"
        end
    end

    import_module 'keybindings'

    for _PATH in $CUSTOM_PATH/{"aliases","functions","completions"}
        for _FILE in (tree "$_PATH" -afinF --noreport | grep -v '/$')
            source "$_FILE"
        end
    end
end

__custom_init__

