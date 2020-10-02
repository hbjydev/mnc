{ pkgs, ... }:
{
  home-manager.users.hayden.home.file.".tmux.conf".text =
    (pkgs.callPackage ./config.nix {});

  environment.systemPackages = with pkgs; [ tmux ];
}
