{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    (if builtins.pathExists ./home-custom.nix then
      ./home-custom.nix
    else
      lib.warn "home-custom.nix not found"
        lib.warn "will use username `qsdrqs` and home directory `/home/qsdrqs`"
        ./empty.nix
    )
  ];

  home.packages = with pkgs; [
    (wrapNeovim nvim-final {
      withPython3 = true;
    })
    yazi
    zoxide
    editor-wrapped
    lsd
    fd
    ripgrep
    grc
    neofetch
    tmux
  ];
}
