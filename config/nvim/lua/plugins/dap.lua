return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui'
  },
  config = function()
    local dap = require('dap')

    dap.adapters.coreclr = {
      type = 'executable',
      command = '/usr/bin/netcoredbg',
      args = { '--interpreter=vscode' }
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }

    local function set_dap_keymaps()
      vim.api.nvim_set_keymap('n', 'n', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'd', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'i', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'p', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
    end

    local function clear_dap_keymaps()
      vim.api.nvim_del_keymap('n', 'n')
      vim.api.nvim_del_keymap('n', 'd')
      vim.api.nvim_del_keymap('n', 'i')
      vim.api.nvim_del_keymap('n', 'p')
    end

    dap.listeners.after['event_initialized']['custom'] = function(_, _)
      set_dap_keymaps()
    end

    dap.listeners.after['event_terminated']['custom'] = function(_, _)
      clear_dap_keymaps()
    end


    vim.api.nvim_set_keymap('n', '<leader>d', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>',
      { noremap = true, silent = true })
  end
}
