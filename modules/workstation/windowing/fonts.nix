{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    source-han-sans
    inter
    inter-ui
    terminus_font
  ];
}
