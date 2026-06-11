return {
  {
    "nvim-neo-tree/neo-tree.nvim",
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
    },
  },
}
