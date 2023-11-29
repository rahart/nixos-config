{ config, lib, pkgs, ... }:
let 
  home.username = "hex";
in {
  #home.overlays = [(import ~/nix-config/overlays/neovim)];
  home.username = "hex";
  home.homeDirectory = "/home/hex";
  home.stateVersion = "23.05";
  xdg.enable = true;
  home.packages = [
    pkgs.bat
    #pkgs.firefox -- firefox takes forever to build in home-manager
    pkgs.jq
    pkgs.fzf
    pkgs.ripgrep
    pkgs.picom
    pkgs.nitrogen
    pkgs.nerdfonts
    pkgs.kubectl
    pkgs.kubectx
    pkgs.go
    pkgs.gopls
    pkgs.nodejs
    pkgs.cargo
    pkgs.rustc
    pkgs.zip
    pkgs.newsboat
    pkgs.tmux
    pkgs.zsh
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
  
  home.file.".tmux.conf".source = ./.tmux.conf;

  xdg.configFile.nvim = {
    source    = ./nvim;
    recursive = true;
  };

  xdg.configFile.alacritty = {
    source = ./alacritty;
    recursive = true;
  };

  xdg.configFile.awesome = {
    source = ./awesome;
    recursive = true;
  };

  xdg.configFile.wallpaper = {
    source = ./wallpaper;
    recursive = true;
  };

  programs.git = {
    enable    = true;
    userName  = "Travis Harrington";
    userEmail = "travis.harrington@gmail.com";
    aliases = {
      s  = "status";
      p  = "push";
      ci = "commit";
      co = "checkout";
    };
    extraConfig = {
      color.ui           = true;
      init.defaultBranch = "main";
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty;
  };
  
  programs.go = {
    enable = true;
    goPath = "code/go";
  };
  
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme  = "strug";
      plugins = [
        "vi-mode"
      ];
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
      rsh = "nix-shell -p pkg-config openssl gcc dbus";
    };
    
    shellGlobalAliases = {
      UUID = "$(uuidgen | tr -d \\n)";
      G = "| grep";
      RG = "| rg";
    };
  };

}
