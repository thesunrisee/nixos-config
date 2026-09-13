{ config, pkgs, ... }:

{
  # Neovim (konfigurasi LazyVim ada di ./nvim)
  home.packages = with pkgs; [
    neovim

    # LSP servers — diinstal via Nix supaya reproduksibel & auto-dikenali LazyVim (PATH)
    lua-language-server
    nil
    gopls
    typescript-language-server
    vscode-langservers-extracted

    # Ekstra bahasa: Go
    delve
    gofumpt

    # Ekstra bahasa: PHP
    php
    phpactor

    # Ekstra bahasa: Python
    pyright
    ruff

    # nvim-treesitter: CLI untuk kompilasi parser (fallback dari prebuilt)
    tree-sitter
    gcc
  ];

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
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
}
