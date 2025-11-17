set -g __fish_git_prompt_show_informative_status 1
set -g fish_greeting

set -x TERMINAL alacritty
set -x XDG_CURRENT_DESKTOP sway

for file in $HOME/.config/fish/config/*
    source $file
end

if test -f $HOME/.config/fish/environment.fish
    source $HOME/.config/fish/environment.fish
else
    echo "Warning: environment variables not defined."
end
