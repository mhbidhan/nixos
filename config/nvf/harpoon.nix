{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      harpoon = {
        package = harpoon;
        setup = "require('harpoon').setup({})";
        after = ["aerial"];
      };
    };
  };
}
