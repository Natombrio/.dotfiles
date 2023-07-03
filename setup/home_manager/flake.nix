{
  description = "Natombrio's nix home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in
    {
      defaultPackage.${system} = home-manager.defaultPackage.${system};
      nixpkgs.config.allowUnfree = true;
      homeConfigurations.home = home-manager.lib.homeManagerConfiguration {
        home.username = "pakke";
        home.homeDirectory = "/home/pakke";

        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./cli.nix
        ];
      };
      homeConfigurations.work = home-manager.lib.homeManagerConfiguration {
        home.username = "patrik";
        home.homeDirectory = "/home/patrik";

        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./cli.nix
        ];
      };
      programs.home-manager.enable = true;
      stateVersion = "23.05";
    };
}

