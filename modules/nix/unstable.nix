{ config, lib, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import (builtins.fetchTarball {
      name = "nixpkgs-unstable-2020-10-06";
      url = "https://github.com/nixos/nixpkgs/archive/e97be2a1660249359ac455d3475f02974741243c.tar.gz";
      sha256 = "0r3014dxyzrfapm7qwf1nmbpy84dg43ck5igjsdk5d7j8akgzbni";
    }) { config = config.nixpkgs.config; };
  };
}
