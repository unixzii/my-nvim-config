return {
  { "mfussenegger/nvim-dap" },

  -- add debugging support for Rust
  {
    "simrat39/rust-tools.nvim",
    opts = function(_, opts)
      local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb"
      local this_os = vim.loop.os_uname().sysname

      if this_os:find("Windows") then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      else
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      opts.dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      }

      return opts
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  -- activate dapui when debugging session started
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      require("dapui").setup({})

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
