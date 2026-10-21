return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    format_on_save = function(buf)
      -- Allow a one-shot "save without format" (see <Leader>W mapping): skip when the buffer flag is set
      if vim.b[buf].disable_autoformat then return false end
      return { async = false, timeout_ms = 500 }
    end,
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
