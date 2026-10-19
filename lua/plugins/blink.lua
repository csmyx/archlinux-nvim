-- 使用 blink.cmp 自带的签名帮助，替代 lsp_signature.nvim
---@type LazySpec
return {
  "saghen/blink.cmp",
  opts = {
    signature = {
      enabled = true,
    },
  },
}
