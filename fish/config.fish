set -g __fish_git_prompt_show_informative_status 1
set -g fish_greeting

set -x TERMINAL alacritty
set -x XDG_CURRENT_DESKTOP sway

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.bun/bin

thefuck --alias | source

for file in $HOME/.config/fish/config/*
    source $file
end
