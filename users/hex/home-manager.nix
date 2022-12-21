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

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
  };

  programs.alacritty = {
    enable = true;
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

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty;
  };

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme  = "robbyrussell";
    };

    shellAliases = {
      ".." = "cd ..";
      ll = "ls -la";
      ltr = "ls -ltr";
      reload = "source ~/.zshrc";
      k = "kubectl";
      kctx = "kubectx";
      vi = "nvim";
      vim = "nvim";
    };
    
    shellGlobalAliases = {
      UUID = "$(uuidgen | tr -d \\n)";
      G = "| grep";
      RG = "| rg";
    };
  };

}
