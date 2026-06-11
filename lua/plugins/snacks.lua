return {
  -- {
  --   "folke/snacks.nvim",
  --   opts = function(_, opts)
  --     -- 安全兜底，防止 nil
  --     opts.picker = opts.picker or {}
  --     opts.picker.sources = opts.picker.sources or {}
  --
  --     -- 只改写 keymaps 来源，其他全部保留
  --     opts.picker.sources.keymaps = {
  --       confirm = function(picker, item)
  --         picker:close()
  --         if not (item.file and item.pos) then return end
  --         -- 安全打开文件
  --         vim.cmd("silent edit " .. vim.fn.fnameescape(item.file))
  --         -- 安全跳转光标，出错不弹窗
  --         pcall(vim.api.nvim_win_set_cursor, 0, {
  --           item.pos[1],
  --           item.pos[2] or 0,
  --         })
  --       end,
  --     }
  --   end,
  -- },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        icons = {
          diagnostics = {
            Error = "",
            Warn = "",
            Hint = "󱠁",
            Info = "",
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
