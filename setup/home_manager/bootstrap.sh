sh <(curl -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf
mkdir -p ~/.config/nixpkgs
cp ~/.dotfiles/setup/home_manager/home.nix ~/.config/home-manager/
cp ~/.dotfiles/setup/home_manager/flake.nix ~/.config/home-manager/
sudo systemctl restart nix-daemon
echo "This requires a restart of the shell 'nix run . switch'"
