{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ alacritty ];

  home-manager.users.hayden = {
    home.file.".config/alacritty/alacritty.yml".source = ./config.yml;  
  };
}
