# Shell configuration
set fish_greeting

# Aliases
alias ls exa
alias l "exa -la"
alias ll "exa -l"
alias vim nvim
alias cat bat
alias grep rg
abbr g git
abbr -a c cat
abbr -a gf "git fetch --all"
abbr -a gP "git push"
abbr -a gp "git pull"
abbr -a gd "git diff"
abbr -a gl "git log"
abbr -a gs "git status"
abbr -a gco "git checkout"
abbr -a gc "git commit -m"
abbr -a ga "git add"
abbr -a gwl "git worktree list"
abbr -a gwa "git worktree add"
abbr -a gwr "git worktree remove"
abbr -a v nvim


# Environment configuration
set -x EDITOR nvim
set -x RUSTC_WRAPPER ~/.cargo/bin/sccache
set -x FZF_DEFAULT_COMMAND fd

# Paths
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/bob/nightly/nvim-linux64/bin/
fish_add_path ~/.local/bin/

# Programs
## Starship
if type -q starship
    mkdir -p ~/.cache/starship/
    starship init fish | source
end

## Zoxide
if type -q zoxide
    zoxide init fish | source
end

## SSH agent
fish_ssh_agent

## Pyenv
if type -q starship
    pyenv init - | source
end
