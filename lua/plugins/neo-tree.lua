return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function()
      -- Workaround for an upstream race: when the current file is outside the
      -- tree root (e.g. after go-to-definition into a cargo registry crate),
      -- neo-tree pops a "File not in cwd. Change cwd?" NuiInput float, and the
      -- double show/focus call races with that float window, leaving a named
      -- buffer behind and failing with
      -- "E95: Buffer with this name already exists".
      -- Auto-cancel the reveal instead of prompting; other confirm dialogs
      -- (delete/rename/git) keep working through the original implementation.
      local ok, inputs = pcall(require, "neo-tree.ui.inputs")
      if ok and inputs.confirm then
        local original = inputs.confirm
        inputs.confirm = function(message, callback)
          if type(message) == "string" and message:find("File not in cwd") then
            if callback then callback(false) end
            return false
          end
          return original(message, callback)
        end
      end
    end,
    -- opts = {
    --   filesystem = {
    --     filtered_items = {
    --       hide_gitignored = false, -- 关键配置：关闭对 Git 忽略项的隐藏
    --       hide_dotfiles = true, -- （可选）如果你想保持隐藏 .dot 文件，请保留此行
    --       hide_by_name = {}, -- （可选）清除默认的隐藏列表
    --     },
    --   },
    -- },
    opts = {
      filesystem = {
        filtered_items = {
          hide_gitignored = false, -- 建议保留为 true，维持 Git 忽略项的隐藏
          never_show = { -- 定义始终不显示的目录，覆盖 hide_gitignored 等设置
            ".git",
            -- "build",           -- 注释掉这一行，确保 build 不被强制隐藏
          },
          always_show = { -- 定义始终显示的目录，优先级最高
            "build", -- 强制显示 build 目录
            "conan",
          },
        },
      },
      event_handlers = {
        {
          -- Workaround for upstream bug #1415/#1365: if the tree window was
          -- closed by external means (:q, :close, <C-w>o, ...) the named
          -- nofile buffer survives, and re-opening fails with
          -- E95 "Buffer with this name already exists".
          -- Delete orphaned neo-tree buffers before a window opens.
          event = "neo_tree_window_before_open",
          handler = function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              local ok, name = pcall(vim.api.nvim_buf_get_name, buf)
              if ok and name:find("neo%-tree") and #vim.fn.win_findbuf(buf) == 0 then
                pcall(vim.api.nvim_buf_delete, buf, { force = true })
              end
            end
          end,
        },
      },
    },
  },
}
