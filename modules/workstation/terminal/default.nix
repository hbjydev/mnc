{ pkgs, ... }:
{
  imports = [ ../../xdg ];

  environment.systemPackages = with pkgs; [ alacritty ];

  users.users.hayden.xdg.config.paths."alacritty/alacritty.yml" =
    pkgs.copyPathToStore ./config.yml;

  home-manager.users.hayden = {
    home.file.".config/alacritty/alacritty.yml".source = ./config.yml;  
  };
}
