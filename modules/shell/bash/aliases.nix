#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ ... }:
{
  environment.shellAliases = {
    s = "sudo";
    
    log = "sudo journalctl --output cat -u";
    log-previous-boot = "sudo journalctl --boot=-1";

    ports = "sudo lsof -Pni";
    pgrep = "pgrep --full";
    pkill = "pkill --full";
    l = "ls -lahXF --group-directories-first";
    v = "nvim";
    vo = "nvim -o (fzf)";
    vv = "nvim -U none";
    r = "rsync -ra --info=progress2";

    # Git Aliases
    g = "git";
    ga = "git add";
    gau = "git add -u";
    gco = "git checkout";
    gc = "git commit --message";
    gca = "git commit --all --message";
    gs = "git status --short";
    gd = "git diff";
    gdc = "git diff --cached";
    gfr = "git pull --rebase";
    gp = "git push";
    gso = "git log -p --all --source -S ";

    fd = "fd --hidden --exclude .git";

    b = "sudo nixos-rebuild switch --keep-going";
    no = "nixos-option";

    ssh = "TERM=xterm-256color ssh";
  };
}
