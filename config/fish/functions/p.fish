function p
    gpg -q -d "$HOME/.password-store/$argv.gpg"
end
