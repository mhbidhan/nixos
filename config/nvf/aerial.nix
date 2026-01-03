{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      aerial = {
        package = aerial-nvim;
        setup = ''
          require('aerial').setup({
            layout = {
              max_width = { 40, 0.2 },
              min_width = 30,
              default_direction = "right",
            },
            highlight_on_hover = true,
            close_on_select = false,
          })
        '';
      };
    };
  };
}
