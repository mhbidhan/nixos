{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    snippets.luasnip.enable = true;

    autocomplete.nvim-cmp = {
      enable = true;

      sources = lib.mkForce {
        nvim_lsp = "[LSP]";
        luasnip = "[Snippet]";
        path = "[Path]";
        buffer = "[Buffer]";
        codeium = "[AI]";
      };

      mappings = {
        next = "<C-n>";
        previous = "<C-p>";
        complete = "<C-Space>";
        confirm = "<CR>";
      };

      setupOpts = {
        completion.completeopt = "menu,menuone,noinsert";
      };
    };
  };
}
