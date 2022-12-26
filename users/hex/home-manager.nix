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
    pkgs.picom
    pkgs.nitrogen
    pkgs.nerdfonts
    pkgs.kubectl
    pkgs.kubectx
    pkgs.go
    pkgs.gopls
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

  xdg.configFile.nvim = {
    source    = ./nvim;
    recursive = true;
  };

  xdg.configFile.alacritty = {
    source = ./alacritty;
    recursive = true;
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
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
    set -g prefix C-a
    unbind C-b
    bind-key C-a send-prefix

    unbind %
    bind | split-window -h

    unbind '"'
    bind - split-window -v

    unbind r
    bind r source-file ~/.tmux.conf

    bind -r j resize-pane -D 5
    bind -r k resize-pane -U 5
    bind -r l resize-pane -R 5
    bind -r h resize-pane -L 5
    
    bind -r m resize-pane -Z
    
    set -g mouse on
    
    bind-key -T copy-mode-vi 'v' send -X begin-selection
    bind-key -T copy-mode-vi 'y' send -X copy-selection
    
    unbind -T copy-mode-vi MouseDragEnd1Pane
    
    set -g @plugin 'tmux-plugins/tpm'
    set -g @plugin 'christoomey/vim-tmux-navigator'
    set -g @plugin 'jimeh/tmux-themepack'
    set -g @plugin 'tmux-plugins/tmux-resurrect'
    set -g @plugin 'tmux-plugins/tmux-continuum'
    
    set -g @themepack 'powerline/default/cyan'
    
    set -g @resurrect-capture-pane-contents 'on'
    set -g @continuum 'on'
    
    run '~/.tmux/plugins/tpm/tpm'
    '';
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
