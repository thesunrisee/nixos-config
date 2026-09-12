{ config, pkgs, ... }:

{
  home.username = "alharis";
  home.homeDirectory = "/home/alharis";

  home.stateVersion = "26.05";

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

    interactiveShellInit = ''
      zoxide init fish | source
    '';
  };

  # Starship
  programs.starship = {
    enable = true;

    settings = {
      format = "$directory$git_branch$git_status$character";

      directory = {
        style = "bold";
        format = "[$path]($style) ";
      };

      git_branch = {
        format = "[$branch]($style) ";
        style = "dimmed";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "dimmed";
      };

      character = {
        success_symbol = "[❯](bold)";
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

      hide_window_decorations = "yes";

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

    shellIntegration = {
      enableFishIntegration = true;
    };
  };

  # User-level environment
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Useful user packages
  home.packages = with pkgs; [
    # CLI
    eza
    bat
    fd
    ripgrep
    fzf
    zoxide

    # System
    btop
    fastfetch
    lazygit

    gh

    # LSP
    lua-language-server
    nil
    gopls
    typescript-language-server
    vscode-langservers-extracted
  ];
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
programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
  ];

  extraLuaConfig = ''
    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
    })

    vim.lsp.config('nil_ls', {
      cmd = { 'nil' },
    })

    vim.lsp.config('gopls', {
      cmd = { 'gopls' },
    })

    vim.lsp.config('ts_ls', {
      cmd = { 'typescript-language-server', '--stdio' },
    })

    vim.lsp.enable({
      'lua_ls',
      'nil_ls',
      'gopls',
      'ts_ls',
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  '';
};
  programs.home-manager.enable = true;
}
