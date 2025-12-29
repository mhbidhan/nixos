return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    vim.keymap.set("n", "<leader><leader>", ui.toggle_quick_menu, {
      desc = "[H]arpoon UI",
    })
    vim.keymap.set("n", "<leader>hm", mark.add_file, {
      desc = "[H]arpoon [M]ark",
    })
    vim.keymap.set("n", "<leader>n", ui.nav_next, {
      desc = "Harpoon [N]ext",
    })
    vim.keymap.set("n", "<leader>p", ui.nav_prev, {
      desc = "Harpoon [P]rev",
    })
    vim.keymap.set("n", "<leader>hc", mark.clear_all, {
      desc = "[H]arpoon [C]lear",
    })
  end,
}
