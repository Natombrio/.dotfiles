# Shell configuration
set fish_greeting

# Aliases
alias ls "exa"
alias ll "exa -l"
alias la "exa -la"
alias vim "nvim"
alias cat "bat"
alias grep "rg"
abbr g "git"
abbr -a gf "git fetch --all"
abbr -a gP "git push"
abbr -a gp "git pull"
abbr -a gs "git status"
abbr -a gco "git checkout"
abbr -a gc "git commit -m"
abbr -a ga "git add"
abbr -a v "nvim"

alias firefox "/mnt/c/Program Files/Mozilla Firefox/firefox.exe"


# Environment configuration
set -x EDITOR nvim
set -x RUSTC_WRAPPER ~/.cargo/bin/sccache
set -x FZF_DEFAULT_COMMAND "fd"

# Paths
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/bob/nightly/nvim-linux64/bin/
fish_add_path ~/.local/bin/

# Programs
## Starship
mkdir -p ~/.cache/starship/
starship init fish | source

## Zoxide
zoxide init fish | source

## SSH agent
fish_ssh_agent

