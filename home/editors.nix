{ config, pkgs, ... }:

{
  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Git
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";

      alias = {
        s = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --oneline --graph --decorate";
        last = "log -1 HEAD";
        unstage = "restore --staged";
      };
    };
  };

  # LSP servers
  home.packages = with pkgs; [
    lua-language-server
    nil
    gopls
    typescript-language-server
    vscode-langservers-extracted
  ];
}
