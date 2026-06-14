return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map

          -- navigate buffer tabs
          ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

          -- mappings seen under group name "Buffer"
          ["<Leader>bd"] = {
            function()
              require("astroui.status.heirline").buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Close buffer from tabline",
          },

          ["gh"] = { "^", desc = "go to head of line" },
          ["gl"] = { "$", desc = "go to tail of line" },
          ["gm"] = { "%", desc = "Jump to matching bracket" },
          ["<C-e>"] = { "3<C-e>", desc = "Scroll up 3 lines" },
          ["<C-y>"] = { "3<C-y>", desc = "Scroll down 3 lines" },
          ["<A-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<A-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

          ["<Leader>lw"] = {
            function() require("snacks").picker.lsp_workspace_symbols { live = true } end,
            desc = "Search workspace symbols",
          },
          ["<Leader>o"] = false,
        },
        v = {
          ["gh"] = { "^", desc = "go to head of line" },
          ["gl"] = { "$", desc = "go to tail of line" },
          ["gm"] = { "%", desc = "Jump to matching bracket" },
          ["<C-e>"] = { "3<C-e>", desc = "Scroll up 3 lines" },
          ["<C-y>"] = { "3<C-y>", desc = "Scroll down 3 lines" },
          ["<A-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<A-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

          ["<Leader>lw"] = {
            function() require("snacks").picker.lsp_workspace_symbols { live = true } end,
            desc = "Search workspace symbols",
          },
          ["<Leader>o"] = false,
        },
        i = {},
        t = {
          ["<C-n>"] = { "<C-\\><C-n>", desc = "Return to normal mode in terminal" },
        },
        c = {
          ["<A-b>"] = { "<C-Left>" },
          ["<A-f>"] = { "<C-Right>" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- swap the two mappings below
          ["<Leader>lr"] = {
            function() vim.lsp.buf.references() end,
            desc = "Search references",
            cond = "textDocument/references",
          },
          ["<Leader>lR"] = {
            function() vim.lsp.buf.rename() end,
            desc = "Rename current symbol",
            cond = "textDocument/rename",
          },
        },
      },
    },
  },
}
