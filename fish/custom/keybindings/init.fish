# keybindings module loader

# well...
function __init__
    set custom_path (dirname (status -f))

    # set modules names here
    set --export module_list


    for _file in (ls "$custom_path" --ignore 'init.fish')
        source "$custom_path/$_file" ||
            echo "cannot load $custom_path/$_file"
        eval (basename -s '.fish' "$_file")
    end
end

__init__
