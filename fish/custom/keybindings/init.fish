# keybindings module loader

# well...
function __init__
    set custom_path (dirname (status -f))

    # set modules names here
    set -a module_list "fish_user_key_bindings.fish"
    set -a module_list "fzf_default_key_bindings.fish"
    set -a module_list "fzf_user_key_bindings.fish"

    # iterate items in module_list
    for _idx in $module_list
        if test -d "$custom_path/$_idx"
            echo "directory: $custom_path/$_idx"
        else if test -f "$custom_path/$_idx"
            echo "file: $custom_path/$_idx"
        else
            echo "WHAT HELL IS: $custom_path/$_idx"
        end

        # source "$custom_path/$_file" ||
        #     echo "cannot load $custom_path/$_file"
        # eval (basename -s '.fish' "$_file")
    end
end

__init__
