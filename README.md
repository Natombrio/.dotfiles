## NOTE: Instructions are mainly for Ubuntu for now.
## Instructions
- WSL2
- Disable windows appending it's own ```$PATH``` to wsl
    >Create /etc/wsl.conf file
    >```
    >[interop]
    >appendWindowsPath=false
    >```
    
    [Source](https://learn.microsoft.com/en-us/windows/wsl/release-notes#build-17713)
- Install new versions of [node](https://github.com/nodesource/distributions/blob/master/README.md#debinstall), git, (gcc | clang), python, rustup,
    rg (ripgrep)
- Install font
    >[RobotoMono Nerd Font](https://www.nerdfonts.com/font-downloads)
- Install [alacritty](https://github.com/alacritty/alacritty/releases) portable version
    >Place alacritty.yml into %USERPROFILE%\AppData\Roaming\alacritty
- Run [Packer quickstart](https://github.com/wbthomason/packer.nvim#quickstart)


## Optional
- system variables:
    EDITOR 	/usr/local/bin/nvim
- nix package manager
- Rust tools
    - nu
    - fd-find
    - Bat (alias to cat)
    - bob-nvim
    - skim
    - starship
    - Bacon (for rust dev.)


## Tool settings
### nu shell
env.nu
```
let-env PATH = ($env.PATH | split row (char esep) | append '/home/pakke/.nix-profile/bin')
let-env PATH = ($env.PATH | split row (char esep) | append '/home/pakke/.cargo/bin')
let-env PATH = ($env.PATH | split row (char esep) | append '/home/pakke/.local/share/bob/nvim-bin')
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

let-env SKIM_DEFAULT_COMMAND = "fd"
```

config.nu
```
buffer_editor: "nvim"

########################
### Custom additions ###
########################


history: {
    max_size: 10000 # Session has to be reloaded for this to take effect
    sync_on_enter: false # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
}

ssh-agent -c | lines | first 2 | parse "setenv {name} {value};" | transpose -i -r -d | load-env

alias ll = ls -la
alias nv = nvim
alias vim = nvim
alias cat = bat
alias grep = rg

source ~/.cache/starship/init.nu
use ~/.config/nushell/completions/cargo-completion.nu *
use ~/.config/nushell/completions/git-completion.nu *

def-env cdf [folder_name?: string] {
    if ($folder_name == null) {
        cd (fd . --type directory -d 1 ~/.config/ ~/linux_projects/ | sk -1)
    } else {
        cd (fd . --type directory -d 1 ~/.config/ ~/linux_projects/ | sk -1 -q $folder_name)
    }
}

def-env cda [folder_name?: string] {
    if ($folder_name == null) {
        cd (fd . --type directory -H | sk)
    } else {
        cd (fd . --type directory -H | sk -q $folder_name)
    }
}

def nvf [file_name?: string] {
    if ($file_name == null) {
        nv (fd . --type file | sk -1)
    } else {
        nv (fd . --type file | sk -1 -q $file_name)
    }
}

```
