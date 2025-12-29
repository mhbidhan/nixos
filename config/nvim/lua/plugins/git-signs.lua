return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({})
    vim.cmd("Gitsigns toggle_current_line_blame")
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
  end,
}
