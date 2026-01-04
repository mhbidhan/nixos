{pkgs, ...}: {
  programs.nvf.settings.vim = {
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      # Languages
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      ts.enable = true;
      markdown.enable = true;
      bash.enable = true;
      html.enable = true;
      css.enable = true;
      tailwind.enable = true;
      go.enable = true;
      java.enable = true;
      csharp.enable = true;
      sql.enable = true;
    };

    snippets.luasnip.enable = true;
    snippets.luasnip.setupOpts = {
      paths = [
        "${pkgs.vimPlugins.friendly-snippets}"
      ];
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      servers.nixd.enable = true;
      lspconfig.enable = true;
      null-ls.enable = true;
    };

    extraPackages = with pkgs; [
      emmet-ls
      nixd
      gopls
      pyright
      rust-analyzer
      omnisharp-roslyn
      codeium
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      angular-language-server
    ];

    luaConfigRC.emmet-ls = ''
      require('lspconfig').emmet_ls.setup({
        filetypes = {
          "css", "eruby", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue"
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        }
      })
    '';
  };
}
