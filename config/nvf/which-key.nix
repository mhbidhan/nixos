_: {
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;
    setupOpts = {
      delay = 300;
      icons = {
        breadcrumb = "»";
        separator = "➜";
        group = "+";
      };
      win = {
        border = "rounded";
        padding = [1 2];
      };
    };
  };
}
