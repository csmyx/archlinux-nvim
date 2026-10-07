---@type LazySpec
return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    opts = {
      -- 默认开启；可用 :NeoCodeium toggle / disable_buffer 控制
      enabled = true,
      -- 默认关闭防抖，速度优先
      debounce = false,
    },
    config = function(_, opts) require("neocodeium").setup(opts) end,
    -- insert 模式键位（已确认与 blink.cmp / toggleterm / 现有 <A-*> 键位无冲突）
    keys = {
      { "<A-f>", function() require("neocodeium").accept() end, mode = "i", desc = "Accept AI suggestion" },
      { "<A-w>", function() require("neocodeium").accept_word() end, mode = "i", desc = "Accept AI suggestion word" },
      { "<A-a>", function() require("neocodeium").accept_line() end, mode = "i", desc = "Accept AI suggestion line" },
      { "<A-e>", function() require("neocodeium").cycle_or_complete() end, mode = "i", desc = "Next AI suggestion" },
      { "<A-r>", function() require("neocodeium").cycle_or_complete(-1) end, mode = "i", desc = "Previous AI suggestion" },
      { "<A-c>", function() require("neocodeium").clear() end, mode = "i", desc = "Clear AI suggestion" },
    },
  },
}
