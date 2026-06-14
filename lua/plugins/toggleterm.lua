return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
    },
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      local astro = require "astrocore"

      -- btop
      local btop = "btop"
      if vim.fn.executable(btop) == 1 then
        maps.n["<Leader>tb"] =
          { function() astro.toggle_term_cmd { cmd = btop, direction = "tab" } end, desc = "ToggleTerm btop" }
      end

      -- claude
      local claude = "claude"
      if vim.fn.executable(claude) == 1 then
        maps.n["<Leader>tc"] =
          { function() astro.toggle_term_cmd { cmd = claude, direction = "tab" } end, desc = "ToggleTerm claude" }
      end

      -- lazygit
      if vim.fn.executable "git" == 1 and vim.fn.executable "lazygit" == 1 then
        local lazygit = {
          callback = function()
            local worktree = astro.file_worktree()
            local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
            -- NOTE: change direction to `tab`
            astro.toggle_term_cmd { cmd = "lazygit " .. flags, direction = "tab" }
          end,
          desc = "ToggleTerm lazygit",
        }
        maps.n["<Leader>tl"] = { lazygit.callback, desc = lazygit.desc }
      end
    end,
  },

  -- default config
  {
    -- "AstroNvim/astrocore",
    -- opts = function(_, opts)
    --   local maps = opts.mappings
    --   local astro = require "astrocore"
    --   maps.n["<Leader>t"] = vim.tbl_get(opts, "_map_sections", "t")
    --   if vim.fn.executable "git" == 1 and vim.fn.executable "lazygit" == 1 then
    --     maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
    --     local lazygit = {
    --       callback = function()
    --         local worktree = astro.file_worktree()
    --         local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
    --         astro.toggle_term_cmd { cmd = "lazygit " .. flags, direction = "float" }
    --       end,
    --       desc = "ToggleTerm lazygit",
    --     }
    --     maps.n["<Leader>gg"] = { lazygit.callback, desc = lazygit.desc }
    --     maps.n["<Leader>tl"] = { lazygit.callback, desc = lazygit.desc }
    --   end
    --   if vim.fn.executable "node" == 1 then
    --     maps.n["<Leader>tn"] = { function() astro.toggle_term_cmd "node" end, desc = "ToggleTerm node" }
    --   end
    --   local gdu = "gdu"
    --   if vim.fn.executable(gdu) ~= 1 then
    --     if vim.fn.has "win32" == 1 then
    --       gdu = "gdu_windows_amd64.exe"
    --     elseif vim.fn.has "mac" == 1 then
    --       gdu = "gdu-go"
    --     end
    --   end
    --   if vim.fn.executable(gdu) == 1 then
    --     maps.n["<Leader>tu"] =
    --       { function() astro.toggle_term_cmd { cmd = gdu, direction = "float" } end, desc = "ToggleTerm gdu" }
    --   end
    --   if vim.fn.executable "btm" == 1 then
    --     maps.n["<Leader>tt"] =
    --       { function() astro.toggle_term_cmd { cmd = "btm", direction = "float" } end, desc = "ToggleTerm btm" }
    --   end
    --   local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
    --   if python then
    --     maps.n["<Leader>tp"] = { function() astro.toggle_term_cmd(python) end, desc = "ToggleTerm python" }
    --   end
    --   maps.n["<Leader>tf"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" }
    --   maps.n["<Leader>th"] =
    --     { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm horizontal split" }
    --   maps.n["<Leader>tv"] = { "<Cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "ToggleTerm vertical split" }
    --   maps.n["<F7>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" }
    --   maps.t["<F7>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" }
    --   maps.i["<F7>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle terminal" }
    --   maps.n["<C-'>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
    --   maps.t["<C-'>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
    --   maps.i["<C-'>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
    -- end,
  },
}
