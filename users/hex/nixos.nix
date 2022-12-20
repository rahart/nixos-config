{ pkgs, ... }:

{
  users.users.hex = {
    isNormalUser = true;
    home = "/home/hex";
    extraGroups = [ "docker" "wheel" ];
    hashedPassword = "$6$zIr2z60i$Cc1cRs5b59P4YvDbnorxz90f.MOyCQVrqFyVS3Z4X/ZaFQKkJP9olTmfwIF.S57H4NIpfynJ61IxjT4RMRYu11";
  };
}
