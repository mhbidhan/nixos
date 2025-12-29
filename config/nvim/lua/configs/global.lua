return {
  config = function()
    -- Set <space> as the leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Set code folding configuration
    vim.o.foldenable = true
    vim.o.foldlevel = 99
    vim.o.foldmethod = "syntax"
    vim.o.foldmethod = "indent"

    -- Set tab space and indents
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2

    -- Set to true if you have a Nerd Font installed and selected in the terminal
    vim.g.have_nerd_font = true

    -- Make line numbers default
    vim.opt.number = true
    vim.opt.relativenumber = true

    -- Enable mouse mode, can be useful for resizing splits for example!
    vim.opt.mouse = "a"

    -- Don't show the mode, since it's already in the status line
    vim.opt.showmode = false

    -- Sync clipboard between OS and Neovim.
    vim.opt.clipboard = "unnamedplus"

    -- Enable break indent
    vim.opt.breakindent = true

    -- Save undo history
    vim.opt.undofile = true

    -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
    vim.opt.ignorecase = true
    vim.opt.smartcase = true

    -- Keep signcolumn on by default
    vim.opt.signcolumn = "yes"

    -- Decrease update time
    vim.opt.updatetime = 250

    -- Decrease mapped sequence wait time
    -- Displays which-key popup sooner
    vim.opt.timeoutlen = 300

    -- Configure how new splits should be opened
    vim.opt.splitright = true
    vim.opt.splitbelow = true

    -- Sets how neovim will display certain whitespace
    vim.opt.list = true
    vim.opt.listchars = {
      tab = "» ",
      trail = "·",
      nbsp = "␣",
    }

    -- Preview substitutions live, as you type!
    vim.opt.inccommand = "split"

    -- Show which line your cursor is on
    vim.opt.cursorline = true

    -- Minimal number of screen lines to keep above and below the cursor.
    vim.opt.scrolloff = 10

    -- Set highlight on search, but clear on pressing <Esc> in normal mode
    vim.opt.hlsearch = true
    vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
      desc = "Go to previous [D]iagnostic message",
    })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
      desc = "Go to next [D]iagnostic message",
    })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
      desc = "Open diagnostic [Q]uickfix list",
    })

    -- Window commands
    vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {
      desc = "Move focus to the left window",
    })
    vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {
      desc = "Move focus to the right window",
    })
    vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {
      desc = "Move focus to the lower window",
    })
    vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {
      desc = "Move focus to the upper window",
    })

    -- Highlight when yanking (copying) text
    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highlight when yanking (copying) text",
      group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {
        clear = true,
      }),
      callback = function()
        vim.highlight.on_yank()
      end,
    })

    -- Pasting without losing register
    vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>p", '"_dP', { noremap = true, silent = true })

    -- Personal keybindings
    vim.keymap.set("i", "<C-j>", "<Esc>o", {
      desc = "Insert a new line below and enter insert mode from insert mode",
    })
    vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
    vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
    vim.keymap.set("n", "n", "nzz", {})
    vim.keymap.set("n", "N", "Nzz", {})

    -- Fold/Unfold code blocks
    --#region Folding
    vim.api.nvim_set_keymap("n", "<leader>o", "zo", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>c", "zc", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>a", "za", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>O", "zR", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>C", "zM", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>j", "zj", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>k", "zk", { noremap = true, silent = true })
    --#endregion
  end,
}
