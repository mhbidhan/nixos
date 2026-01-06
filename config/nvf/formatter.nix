{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPackages = [pkgs.prettier];

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          html = ["prettier"];
          htmlangular = ["prettier"];
          css = ["prettier"];
          javascript = ["prettier"];
          typescript = ["prettier"];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };
  };
}
