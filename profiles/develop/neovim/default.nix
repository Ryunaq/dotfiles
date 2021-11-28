{ lib, pkgs, ... }:
let
  inherit (lib) fileContents;
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        ${(fileContents ./general.vim)}
        ${(fileContents ./vimtex.vim)}
        ${(fileContents ./coc.vim)}
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          vim-startify
          airline
          sensible
          polyglot
          ale
          fugitive
          vimtex
          coc-vimtex
          coc-nvim
        ];
        opt = [ ];
      };
    };
  };
}
