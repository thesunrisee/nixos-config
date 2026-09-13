{ config, pkgs, ... }:

{
  # Fish
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lah --icons --group-directories-first";
      la = "eza -a --icons --group-directories-first";

      cat = "bat";
      grep = "rg";

      ".." = "cd ..";
      "..." = "cd ../..";

      v = "nvim";
      lg = "lazygit";
      bt = "btop";
    };
  };

  # Starship
  programs.starship = {
    enable = true;

    settings = {
      format = "$directory$git_branch$git_status$character";

      directory = {
        style = "bold cyan";
        format = "[$path]($style) ";
      };

      git_branch = {
        format = "[$branch]($style) ";
        style = "bold blue";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "green";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };

  # Zoxide
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # FZF
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  # Kitty
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11.5;
    };

    settings = {
      window_padding_width = 12;
      confirm_os_window_close = 0;

      hide_window_decorations = "no";

      cursor_shape = "beam";
      cursor_blink_interval = 0;

      scrollback_lines = 10000;

      repaint_delay = 10;
      input_delay = 0;

      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      url_style = "curly";
    };

    # Nord palette (nord0-nord15) — kitty conf (settings tak bisa berisi attrset)
    extraConfig = ''
      background          #2E3440
      foreground          #D8DEE9
      selection_background #4C566A
      selection_foreground #D8DEE9
      url_color           #88C0D0
      cursor              #D8DEE9
      cursor_text_color   #2E3440

      active_tab_foreground   #2E3440
      active_tab_background   #D8DEE9
      inactive_tab_foreground #D8DEE9
      inactive_tab_background #4C566A

      color0  #3B4252
      color1  #BF616A
      color2  #A3BE8C
      color3  #EBCB8B
      color4  #81A1C1
      color5  #B48EAD
      color6  #88C0D0
      color7  #E5E9F0
      color8  #4C566A
      color9  #BF616A
      color10 #A3BE8C
      color11 #EBCB8B
      color12 #81A1C1
      color13 #B48EAD
      color14 #8FBCBB
      color15 #ECEFF4
    '';

    shellIntegration = {
      enableFishIntegration = true;
    };
  };

  # CLI essentials
  home.packages = with pkgs; [
    eza
    bat
    fd
    ripgrep
  ];
}
