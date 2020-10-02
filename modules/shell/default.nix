#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, ... }:
{
  imports = [
    ./alias ./direnv ./less ./tmux
  ];

  environment.systemPackages = with pkgs; [
    aria2
    atool
    bat
    bind
    bind.dnsutils
    binutils
    coreutils-prefixed
    curl
    dosfstools
    execline
    exfat
    file
    fzf
    gotop
    htop
    inetutils
    iotop
    jq
    lsof
    lshw
    mtools
    neofetch
    nixops
    nmap
    ntfs3g
    (import ./nvim)
    openssh
    pciutils
    ripgrep
    rsync
    sshfs
    sshfsFuse
    unixtools.watch
    unrar
    unzip
    usbutils
    wget
    whois
    zip
  ];

  services.udev.packages = [ pkgs.libu2f-host ];

  environment.variables.CLICOLOR = "1";
  environment.variables.EDITOR = "nvim";
  environment.variables.EMAIL = "hi@hbjy.dev";
}
