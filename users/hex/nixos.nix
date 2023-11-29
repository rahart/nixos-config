{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.hex = {
    isNormalUser = true;
    home = "/home/hex";
    shell = pkgs.zsh;
    extraGroups = [ "docker" "wheel" ];
    hashedPassword = "$y$j9T$vKzFOXvCrjsDPhiCwVLHR0$t5f8y.fXNtWTPCHozdQQVvR1303L3HroCujvYfyuCT3";
  };
}
