{ config, lib, pkgs, ... }:
let 
  home.username = "hex";
in {
  home.username = "hex";
  home.homeDirectory = "/home/hex";
  home.stateVersion = "22.11";
  xdg.enable = true;
  home.packages = [
    pkgs.bat
    pkgs.firefox
    pkgs.jq
    pkgs.ripgrep
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      key_bindings = [
        { key = "K"; mods="Command"; chars = "ClearHistory"; }
        { key = "C"; mods="Command"; chars = "Copy"; }
        { key = "V"; mods="Command"; chars = "Paste"; }
      ];
    };
  };

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable    = true;
    userName  = "Travis Harrington";
    userEmail = "travis.harrington@gmail.com";
    extraConfig = {
      color.ui           = true;
      init.defaultBranch = "main";
    };
  };

  programs.tmux = {
    enable = true;
  };

}
