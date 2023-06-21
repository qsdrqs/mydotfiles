{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./dotfiles.nix
    inputs.nix-index-database.hmModules.nix-index
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "qsdrqs";
  home.homeDirectory = "/home/qsdrqs";
  home.packages = with pkgs; [
    htop
    lazygit
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtraFirst = ''
      if [ -e $HOME/.zshrc ]; then
        ZSH_CUSTOM="$HOME/zsh_custom"
        source $HOME/.zshrc
      fi
    '';
    completionInit = ""; # define in my own zshrc
  };
  programs.ssh.enable = true;
  programs.ssh.matchBlocks = {
    docean = {
      host = "Docean";
      hostname = "143.110.233.113";
      user = "root";
    };
    aliyun = {
      host = "Aliyun";
      hostname = "8.140.148.238";
      user = "root";
    };
    deskserver = {
      host = "DESKSERVER";
      hostname = "143.110.233.113";
      user = "qsdrqs";
      port = 3322;
    };
    rasparch = {
      host = "RaspArch";
      hostname = "143.110.233.113";
      user = "qsdrqs";
      port = 3323;
    };
};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.nix-index.enable = true;

  programs.git = {
    enable = true;
    userName  = "qsdrqs";
    userEmail = "qsdrqs@gmail.com";
    signing.key = "E2D709340CE26E78";
    signing.signByDefault = true;
    extraConfig = {
      core = {
        editor = "$EDITOR";
        pager = "cat";
      };
      credential = {
        helper = "store";
      };
      pull = {
        rebase = true;
      };
    };
  };
}
