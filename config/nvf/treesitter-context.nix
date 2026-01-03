{pkgs, ...}: {
  programs.nvf.settings.vim.extraPlugins.treesitter-context = {
    package = pkgs.vimPlugins.nvim-treesitter-context;
    setup = ''
      require('treesitter-context').setup({
        max_lines = 3,
        line_numbers = true,
      })
    '';
  };
}
