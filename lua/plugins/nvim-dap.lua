return {
  "mfussenegger/nvim-dap",
  dependencies={
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    local lastExec = ""
    local lastArg = ""

    --dap.listeners.before.attach.dapui_config = function()
    --  dapui.open()
    --end
    --dap.listeners.before.launch.dapui_config = function()
    --  dapui.open()
    --end
    --dap.listeners.before.event_terminated.dapui_config = function()
    --  dapui.close()
    --end
    --dap.listeners.before.event_exited.dapui_config = function()
    --  dapui.close()
    --end

    --vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
    --vim.keymap.set('n', '<Leader>dB', dap.set_breakpoint, {})
    vim.keymap.set('n', '<Leader>dc', dapui.toggle, {})
    --
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
    }
    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          if lastExec == "" then
            lastExec = vim.fn.input('Executable name: ', '' ,'file')
          end
          return vim.fn.input('Path to executable ok?: ', vim.fn.getcwd() .. '/' .. lastExec, 'file')
        end,
        args = function()
          if lastArg == "" then
            lastArg = vim.fn.input('Arguments: ')
          end
          return vim.split(vim.fn.input('Arguments ok?: ', lastArg), " +")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
          local name = vim.fn.input('Executable name (filter): ')
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
      },
    }
    dap.configurations.cpp=dap.configurations.c
    dap.configurations.fortran=dap.configurations.c
    dapui.setup()
  end,
}
