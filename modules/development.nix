{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget

    gcc

    nodejs
    python3
    go

    vscode
    opencode
  ];
}
