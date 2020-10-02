{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ less ];
  environment.variables.LESS = "cRS";
}
