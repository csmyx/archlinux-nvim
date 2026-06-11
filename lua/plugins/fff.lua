return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    -- downloads a prebuilt binary or falls back to cargo build
    require("fff.download").download_or_build_binary()
  end,
  -- for nixos:
  -- build = "nix run .#release",
  opts = {
    debug = {
      enabled = true,
      show_scores = true,
    },
  },
  lazy = false, -- the plugin lazy-initialises itself
  keys = {
    { "<Leader>Ff", function() require("fff").find_files() end, desc = "FFFind files" },
    { "<Leader>Fg", function() require("fff").live_grep() end, desc = "LiFFFe grep" },
    {
      "<Leader>Fz",
      function() require("fff").live_grep { grep = { modes = { "fuzzy", "plain" } } } end,
      desc = "Live fffuzy grep",
    },
    {
      "<Leader>Fc",
      function() require("fff").live_grep { query = vim.fn.expand "<cword>" } end,
      desc = "Search current word",
    },
  },
}
