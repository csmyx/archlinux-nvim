return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- 保存时自动格式化
    format_on_save = {
      async = false,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      sh = { "shfmt" },
      zsh = { "shfmt" },
      bash = { "shfmt" },
    },
    formatters = {
      shfmt = {
        args = { "-i", "2", "-ci", "-ln", "zsh" },
      },
    },
  },
}
