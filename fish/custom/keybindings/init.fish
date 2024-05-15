# keybindings module loader

# well...
function __init__
    set custom_path (dirname (status -f))

    # set modules names here
    set -a module_list "fish_user_key_bindings"
    set -a module_list "fzf_default_key_bindings"
    set -a module_list "fzf_user_key_bindings"

    # iterate items in module_list
    for _idx in $module_list
        if test -r "$custom_path/$_idx.fish"
            source "$custom_path/$_idx.fish" &&
            eval (basename -s '.fish' "$_idx")
        else
            echo "WHAT HELL IS: $custom_path/$_idx"
        end
    end
end

__init__
