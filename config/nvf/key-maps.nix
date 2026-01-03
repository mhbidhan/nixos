{...}: {
  programs.nvf.settings.vim.keymaps = [
    # Which key
    {
      key = "<leader>?";
      action = "<cmd>WhichKey<CR>";
      mode = "n";
      desc = "Search all keymaps";
    }
    # Window Navigation
    {
      key = "<C-h>";
      action = "<C-w><C-h>";
      mode = "n";
      desc = "Focus Left";
    }
    {
      key = "<C-l>";
      action = "<C-w><C-l>";
      mode = "n";
      desc = "Focus Right";
    }
    {
      key = "<C-j>";
      action = "<C-w><C-j>";
      mode = "n";
      desc = "Focus Lower";
    }
    {
      key = "<C-k>";
      action = "<C-w><C-k>";
      mode = "n";
      desc = "Focus Upper";
    }

    # General & Editing
    {
      key = "<leader>s";
      action = ":lua vim.lsp.buf.format()<CR>";
      mode = ["n" "v"];
      desc = "Format file or selection";
    }
    {
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      mode = "n";
    }
    {
      key = "<leader>p";
      action = "\"_dP";
      mode = ["n" "v"];
      silent = true;
      desc = "Paste without losing register";
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      mode = "n";
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      mode = "n";
    }
    {
      key = "n";
      action = "nzz";
      mode = "n";
    }
    {
      key = "N";
      action = "Nzz";
      mode = "n";
    }
    {
      key = "<C-j>";
      action = "<Esc>o";
      mode = "i";
      desc = "New line below";
    }

    # Folding
    {
      key = "<leader>o";
      action = "zo";
      mode = "n";
      silent = true;
    }
    {
      key = "<leader>c";
      action = "zc";
      mode = "n";
      silent = true;
    }
    {
      key = "<leader>a";
      action = "za";
      mode = "n";
      silent = true;
    }

    # Neo-tree
    {
      key = "<leader>e";
      action = ":Neotree reveal float<CR>";
      mode = "n";
      desc = "Toggle Neotree";
    }

    # Telescope
    {
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      mode = "n";
      desc = "Find Help";
    }
    {
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<CR>";
      mode = "n";
      desc = "Find Keymaps";
    }
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      mode = "n";
      desc = "Find Files";
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      mode = "n";
      desc = "Find Buffers";
    }
    {
      key = "<leader>fm";
      action = "<cmd>Telescope harpoon marks<CR>";
      mode = "n";
      desc = "Find Marks";
    }
    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      mode = "n";
      desc = "Find by Grep";
    }
    {
      key = "<leader>fd";
      action = "<cmd>Telescope diagnostics<CR>";
      mode = "n";
      desc = "Find Diagnostics";
    }
    {
      key = "<leader>fr";
      action = "<cmd>Telescope resume<CR>";
      mode = "n";
      desc = "Find Resume";
    }
    {
      key = "<leader>f.";
      action = "<cmd>Telescope oldfiles<CR>";
      mode = "n";
      desc = "Find Recent Files";
    }
    {
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      mode = "n";
      desc = "Go to Definition";
    }
    {
      key = "gr";
      action = "<cmd>Telescope lsp_references<CR>";
      mode = "n";
      desc = "Go to References";
    }
    {
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      mode = "n";
      desc = "Hover Documentation";
    }
    {
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      mode = "n";
      desc = "Rename Variable";
    }
    {
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      mode = "n";
      desc = "Code Action";
    }
    # Harpoon
    {
      key = "<leader><leader>";
      action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>";
      mode = "n";
      desc = "Harpoon UI";
    }
    {
      key = "<leader>hm";
      action = "<cmd>lua require('harpoon.mark').add_file()<CR>";
      mode = "n";
      desc = "Harpoon Mark File";
    }
    {
      key = "<leader>n";
      action = "<cmd>lua require('harpoon.ui').nav_next()<CR>";
      mode = "n";
      desc = "Harpoon Next";
    }
    {
      key = "<leader>p";
      action = "<cmd>lua require('harpoon.ui').nav_prev()<CR>";
      mode = "n";
      desc = "Harpoon Prev";
    }
    {
      key = "<leader>hc";
      action = "<cmd>lua require('harpoon.mark').clear_all()<CR>";
      mode = "n";
      desc = "Harpoon Clear All";
    }
    # Aerial nvim
    {
      key = "<leader>a";
      action = "<cmd>AerialToggle! left<CR>";
      mode = "n";
      desc = "Toggle Outline (Aerial)";
    }
    {
      key = "{";
      action = "<cmd>AerialPrev<CR>";
      mode = "n";
      desc = "Previous Symbol";
    }
    {
      key = "}";
      action = "<cmd>AerialNext<CR>";
      mode = "n";
      desc = "Next Symbol";
    }
  ];
}
