return {
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
      mappings = {
        i = {                               -- Insert mode mappings
          ["<C-h>"] = "move_selection_previous", -- Move to the previous item
          ["<C-j>"] = "move_selection_next", -- Move to the next item
          ["<C-k>"] = "move_selection_previous", -- Move to the previous item
          ["<C-l>"] = "move_selection_next", -- Move to the next item
        },
        n = {                               -- Normal mode mappings
          ["<C-h>"] = "move_selection_previous", -- Move to the previous item
          ["<C-j>"] = "move_selection_next", -- Move to the next item
          ["<C-k>"] = "move_selection_previous", -- Move to the previous item
          ["<C-l>"] = "move_selection_next", -- Move to the next item
        },
      },
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    pcall(require("telescope").load_extension, "harpoon")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
      desc = "[F]ind [H]elp",
    })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, {
      desc = "[F]ind [K]eymaps",
    })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {
      desc = "[F]ind [F]iles",
    })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {
      desc = "[F]ind [B]uffers",
    })
    vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>", {
      desc = "[F]ind [M]arks",
    })
    vim.keymap.set("n", "<leader>fs", builtin.builtin, {
      desc = "[F]ind [S]elect Telescope",
    })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, {
      desc = "[F]ind current [W]ord",
    })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
      desc = "[F]ind by [G]rep",
    })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {
      desc = "[F]ind [D]iagnostics",
    })
    vim.keymap.set("n", "<leader>fr", builtin.resume, {
      desc = "[F]ind [R]esume",
    })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, {
      desc = '[F]ind Recent Files ("." for repeat)',
    })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, {
      desc = "[/] Fuzzily search in current buffer",
    })

    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, {
      desc = "[S]earch [/] in Open Files",
    })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config"),
      })
    end, {
      desc = "[S]earch [N]eovim files",
    })
  end,
}
