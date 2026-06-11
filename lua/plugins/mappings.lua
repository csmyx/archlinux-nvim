return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["gh"] = { "^", desc = "go to head of line" },
          ["gl"] = { "$", desc = "go to tail of line" },
          ["gm"] = { "%", desc = "Jump to matching bracket" },
          ["<C-e>"] = { "3<C-e>", desc = "Scroll up 3 lines" },
          ["<C-y>"] = { "3<C-y>", desc = "Scroll down 3 lines" },

          ["<Leader>c"] = { "<Cmd>confirm q<CR>", desc = "Quit Window" },
          ["<Leader>C"] = { "<Cmd>confirm qall<CR>", desc = "Exit AstroNvim" },
          ["<Leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
          ["<Leader>Q"] = {
            function() require("astrocore.buffer").close(0, true) end,
            desc = "Force close buffer",
          },
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

          ["<Leader>c"] = { "<Cmd>confirm q<CR>", desc = "Quit Window" },
          ["<Leader>C"] = { "<Cmd>confirm qall<CR>", desc = "Exit AstroNvim" },
          ["<Leader>q"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
          ["<Leader>Q"] = {
            function() require("astrocore.buffer").close(0, true) end,
            desc = "Force close buffer",
          },
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
          -- -- this mapping will only be set in buffers with an LSP attached
          -- K = {
          --   function() vim.lsp.buf.hover() end,
          --   desc = "Hover symbol details",
          -- },
          -- -- condition for only server with declaration capabilities
          -- gD = {
          --   function() vim.lsp.buf.declaration() end,
          --   desc = "Declaration of current symbol",
          --   cond = "textDocument/declaration",
          -- },

          -- Override the default lsp mappings in `_astrolsp_mappings.lua`
          ["<Leader>lL"] = {
            function() vim.lsp.codelens.refresh() end,
            desc = "LSP CodeLens refresh",
            cond = "textDocument/codeLens",
          },
          ["<Leader>ll"] = {
            function() vim.lsp.codelens.run() end,
            desc = "LSP CodeLens run",
            cond = "textDocument/codeLens",
          },
          -- ["<Leader>uL"] = {
          --   function() require("astrolsp.toggles").codelens() end,
          --   desc = "Toggle CodeLens",
          --   cond = "textDocument/codeLens",
          -- },

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
