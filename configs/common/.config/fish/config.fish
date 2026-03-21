# Shell configuration
set fish_greeting

# Aliases
alias ls exa
alias l "exa -la"
alias ll "exa -l"
alias cat bat
abbr -a v nvim


# Environment configuration
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND fd --hidden --follow --exclude .git
set -x LOCALE_ARCHIVE /usr/lib/locale/locale-archive
if type -q device_specific
    device_specific
end

if status is-interactive
    tv init fish | source
end

# Paths
fish_add_path ~/.local/bin/

# Programs
## SSH agent
fish_ssh_agent


## Starship
if type -q starship
    mkdir -p ~/.cache/starship/
    starship init fish | source
end

## Zoxide
if type -q zoxide
    zoxide init fish | source
end

if type -q wine
    set -x WINEPREFIX /home/natombrio/.wine
end

## Pyenv
if type -q pyenv
    pyenv init - | source
end

## cargo
if type -q cargo
    fish_add_path ~/.cargo/bin
end
## Sccache
if type -q sccache
    set -x RUSTC_WRAPPER ~/.cargo/bin/sccache
end

# bun
if type -q bun
    set -x BUN_INSTALL "$HOME/.bun"
    set -x PATH $BUN_INSTALL/bin $PATH
end
