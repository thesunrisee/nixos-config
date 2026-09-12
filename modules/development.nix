{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget

    nodejs
    python3
    go

    neovim
    vscode
    opencode
  ];
}
