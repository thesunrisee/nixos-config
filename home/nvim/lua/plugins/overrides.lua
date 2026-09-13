return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      -- Gunakan binary dari PATH (Nix) untuk server yang sudah dipasang via nix,
      -- supaya tidak dipakai binary Mason yang (dinamik) tidak jalan di NixOS.
      for _, server in ipairs({ "lua_ls", "gopls", "pyright", "ruff", "phpactor", "ts_ls" }) do
        opts.servers[server] = vim.tbl_extend("force", opts.servers[server] or {}, { mason = false })
      end
      -- TypeScript: pakai ts_ls (typescript-language-server via Nix) bukan vtsls (Mason).
      -- Nama server di lspconfig modern adalah `ts_ls`, bukan `tsserver` (sudah dihapus).
      if opts.servers.ts_ls then
        opts.servers.ts_ls.enabled = true
      end
      if opts.servers.vtsls then
        opts.servers.vtsls.enabled = false
      end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- dlv (delve) sudah tersedia via Nix, jangan digandakan oleh Mason.
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "delve"
      end, opts.ensure_installed or {})
    end,
  },
}