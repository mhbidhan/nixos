{...}: {
  programs.nvf.settings.vim.filetree.neo-tree = {
    enable = true;
    setupOpts = {
      popup_border_style = "rounded";
      filesystem = {
        filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
        };
      };
      default_component_configs = {
        icon = {
          folder_closed = "";
          folder_open = "";
          folder_empty = "󰜌";
          default = "*";
        };
      };
    };
  };
}
