function fish_prompt
    if set -q ZMX_SESSION
        echo -n "[$ZMX_SESSION] "
    end
    set_color $fish_color_cwd
    echo -n (basename $PWD)') '
end
