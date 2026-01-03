{...}: {
  programs.nvf.settings.vim = {
    telescope = {
      enable = true;
      setupOpts = {
        defaults = {
          file_ignore_patterns = ["node_modules"];
          mappings = {
            i = {
              "<C-h>" = "move_selection_previous";
              "<C-j>" = "move_selection_next";
              "<C-k>" = "move_selection_previous";
              "<C-l>" = "move_selection_next";
            };
            n = {
              "<C-h>" = "move_selection_previous";
              "<C-j>" = "move_selection_next";
              "<C-k>" = "move_selection_previous";
              "<C-l>" = "move_selection_next";
            };
          };
        };
      };
    };
  };
}
