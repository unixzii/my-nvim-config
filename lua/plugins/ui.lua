return {
  -- add ayu theme
  {
    "Shatur/neovim-ayu",
    opts = {
      mirage = false,
      overrides = {
        Normal = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { fg = "#1D232C", bg = "None" },
      },
    },
    config = function(_, opts)
      local ayu = require("ayu")
      ayu.setup(opts)
      vim.cmd("colorscheme ayu-dark")
    end,
  },

  -- fix nvim-notify warnings
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.background_colour = "#000000"
      return opts
    end,
  },

  -- replace dashboard banner
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = [[
██╗    ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]
      return opts
    end,
  },

  -- enable mini-animate
  { import = "lazyvim.plugins.extras.ui.mini-animate" },

  -- tweak neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts["source_selector"] = {
        winbar = true,
      }
      return opts
    end,
  },

  -- dressing.nvim
  {
    "stevearc/dressing.nvim",
    opts = function(_, opts)
      opts.input = {
        title_pos = "left",
      }
      return opts
    end,
  },

  -- mini map
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = false,
      })
      vim.api.nvim_set_hl(0, "CodewindowBorder", { fg = "#1D232C" })
      codewindow.apply_default_keybinds()
      codewindow.open_minimap()
    end,
  },
}
