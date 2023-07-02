{ pkgs, ... }:

{
  home = {
    username = "pakke";
    homeDirectory = "/home/pakke";

    packages = with pkgs; [
      bat
      clang
      exa
      fd
      fzf
      gh
      git
      neovim
      nodejs_20
      ripgrep
      starship
      tldr
      unzip
      wget
      zoxide
    ];

    stateVersion = "23.05";
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
