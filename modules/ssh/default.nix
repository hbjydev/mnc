#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ config, pkgs, lib, ... }:
let
  inherit (lib) concatStringsSep;

  mkDefault = lib.mkOverride ((lib.mkDefault null).priority - 1);

  bannedAlgorithms = [
    "ecdsa-sha2-nistp256-cert-v01@openssh.com"
    "ecdsa-sha2-nistp384-cert-v01@openssh.com"
    "ecdsa-sha2-nistp521-cert-v01@openssh.com"
    "ecdsa-sha2-nistp256"
    "ecdsa-sha2-nistp384"
    "ecdsa-sha2-nistp521"
  ];
in
{
  programs.mosh.enable = mkDefault config.services.openssh.enable;  

  programs.ssh.extraConfig = ''
    CASignatureAlgorithms -${concatStringsSep "," bannedAlgorithms}
    HostKeyAlgorithms -${concatStringsSep "," bannedAlgorithms}
    VerifyHostKeyDNS=ask

    Host github gitlab
      HostName %h.com

    Match host github.com,gitlab.com
      User git
  '';

  services.openssh.authorizedKeysFiles = [ "${./keys}/%u.keys" ];
  users.users.root.openssh.authorizedKeys.keyFiles = [ ./keys/hayden.keys ];

  programs.ssh.knownHosts = {
    "github.com" = {
      publicKeyFile = ./keys/github.keys;
    };

    "gitlab.com" = {
      publicKeyFile = ./keys/gitlab.keys;
    };
  };
}
