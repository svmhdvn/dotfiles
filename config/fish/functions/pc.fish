function pc
    gpg -q -d "$HOME/.password-store/$argv.gpg" | head -1 | wl-copy
end
