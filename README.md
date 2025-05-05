## Instructions
- WSL2
- Ansible configs are for Arch only
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


## Optional
- system variables:
    EDITOR 	/usr/local/bin/nvim
- Rust tools
    - fd-find
    - Bat
    - bob-nvim
    - skim
    - starship
    - Bacon (for rust dev.)

## Dotfile sync using stow

Common packages
```bash
stow common
```

Hyprland/Desktop specific
```bash
stow common; stow hyprland;
```
