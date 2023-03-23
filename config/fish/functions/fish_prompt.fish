function fish_prompt
    set_color $fish_color_user
    echo -n (basename $PWD)
    set_color normal
    echo -n ' ) '
end
