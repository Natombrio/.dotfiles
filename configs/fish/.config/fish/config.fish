# Shell configuration
set fish_greeting

# Aliases
alias ls exa
alias l "exa -la"
alias ll "exa -l"
alias cat bat
alias v nvim
abbr -a v nvim
abbr g git
abbr -a gf "git fetch --all"
abbr -a gP "git push"
abbr -a gp "git pull"
abbr -a gd "git diff"
abbr -a gl "git log"
abbr -a gs "git status"
abbr -a gco "git checkout"
abbr -a gcm "git commit -m"
abbr -a ga "git add"
abbr -a gwl "git worktree list"
abbr -a gwa "git worktree add"
abbr -a gwr "git worktree remove"
abbr -a vc "nvim --cmd 'syntax off'"


# Environment configuration
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND fd
set -x LOCALE_ARCHIVE /usr/lib/locale/locale-archive
if type -q device_specific
    device_specific
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
    zoxide init --cmd cd fish | source
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
