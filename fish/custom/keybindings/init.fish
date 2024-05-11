# keybindings module loader

# well...
function __init__
    set custom_path (dirname (status -f))

    # set modules names here
    set -a module_list "fish_user_key_bindings.fish"
    set -a module_list "fzf_default_key_bindings.fish"
    set -a module_list "fzf_user_key_bindings.fish"


    for _file in (ls "$custom_path" --ignore 'init.fish')
        source "$custom_path/$_file" ||
            echo "cannot load $custom_path/$_file"
        eval (basename -s '.fish' "$_file")
    end
end

__init__
