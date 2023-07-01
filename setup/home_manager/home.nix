{ config, pkgs, ... }: {
  home = {
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

    stateVersion = "22.11";
    username = "pakke";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;
}
