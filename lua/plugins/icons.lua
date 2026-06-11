return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      icons = {
        DapBreakpoint = "",
        DapBreakpointCondition = "",
        DapBreakpointRejected = "",
        DapLogPoint = "",
        DapStopped = "",

        DefaultFile = "",
        Diagnostic = "",
        DiagnosticError = "",
        DiagnosticHint = "󱠁",
        DiagnosticInfo = "",
        DiagnosticWarn = "",
        WordFile = "󱀽",
        FileModified = "",
        FileNew = "",
        Search = "",
        Projects = "",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "error" },
        SAFETY = { icon = "💀", color = "error" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "⚡", color = "warning", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "🚀", color = "info", alt = { "TESTING", "PASSED", "FAILED" } },
        TEMP = { icon = "📝", color = "info" },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      highlight = {
        multiline = false, -- toggle multine todo comments
      },
    },
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      filetype = {
        -- cpp = { glyph = "󰙲", hl = "MiniIconsAzure" },
        -- cpp = { glyph = "", hl = "MiniIconsAzure" },
        -- yaml = { glyph = "", hl = "MiniIconsPurple" },
        -- sh = { glyph = "", hl = "MiniIconsGreen" },
        -- zsh = { glyph = "", hl = "MiniIconsGreen" },
        -- bash = { glyph = "", hl = "MiniIconsGreen" },
        -- fish = { glyph = "", hl = "MiniIconsGreen" },
      },
      extension = {
        -- h = { glyph = "󰫵", hl = "MiniIconsPurple" },
        h = { glyph = "", hl = "MiniIconsPurple" },
      },
      lsp = {
        -- array = { glyph = "" },
        -- boolean = { glyph = "" },
        -- key = { glyph = "" },
        -- namespace = { glyph = "" },
        -- null = { glyph = "" },
        -- number = { glyph = "" },
        -- object = { glyph = "" },
        object = { glyph = "" },
        -- package = { glyph = "" },
        -- string = { glyph = "" },
        -- class = { glyph = "" },
        -- color = { glyph = "" },
        -- constant = { glyph = "" },
        -- constructor = { glyph = "" },
        -- enum = { glyph = "" },
        -- enummember = { glyph = "" },
        -- event = { glyph = "" },
        -- field = { glyph = "" },
        -- file = { glyph = "" },
        -- folder = { glyph = "" },
        -- ["function"] = { glyph = "" },
        -- interface = { glyph = "" },
        -- keyword = { glyph = "" },
        -- method = { glyph = "" },
        -- module = { glyph = "" },
        -- operator = { glyph = "" },
        -- property = { glyph = "" },
        -- reference = { glyph = "" },
        -- snippet = { glyph = "" },
        -- struct = { glyph = "" },
        -- text = { glyph = "" },
        -- typeparameter = { glyph = "" },
        -- unit = { glyph = "" },
        -- value = { glyph = "" },
        -- variable = { glyph = "" },
      },
    },
  },
}
