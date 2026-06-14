return {
  "anuvyklack/windows.nvim",
  enabled = false,
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          opt = {
            winwidth = 10,
            winminwidth = 10,
            equalalways = false,
          },
        },
      },
    },
    { -- AstroCore is always loaded on startup, so making it a dependency doesn't matter
      "AstroNvim/astrocore",
      opts = {
        mappings = { -- define a mapping to invoke the command
          n = {
            ["<C-w>z"] = function() vim.cmd "WindowsMaximize" end,
            ["<C-w>_"] = function() vim.cmd "WindowsMaximizeVertically" end,
            ["<C-w>|"] = function() vim.cmd "WindowsMaximizeHorizontally" end,
            ["<C-w>="] = function() vim.cmd "WindowsEqualize" end,
          },
        },
      },
    },
  },
  opts = {},
  cmd = {
    "WindowsMaximize",
    "WindowsMaximizeVertically",
    "WindowsMaximizeHorizontally",
    "WindowsEqualize",
    "WindowsEnableAutowidth",
    "WindowsDisableAutowidth",
    "WindowsToggleAutowidth",
  },
}
