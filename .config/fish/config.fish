# Disable Fish greeting
set -g fish_greeting

if status is-interactive
    # Starship Prompt
    starship init fish | source

    # Eza - Modern ls with icons
    alias ls='eza --icons=always --group-directories-first'
    alias ll='eza -lah --icons=always --group-directories-first'
    alias la='eza -a --icons=always --group-directories-first'
    alias lt='eza --tree --icons=always'
end
