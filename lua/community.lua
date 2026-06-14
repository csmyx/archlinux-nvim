-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  ---- language packs ----
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },

  ---- tools ----
  { import = "astrocommunity.motion.flash-nvim" },
  -- { import = "astrocommunity.split-and-window.windows-nvim" },

  ---- ui/ux ----
  -- { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.git.codediff-nvim" },

  ---- themes ----
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.bamboo-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
}
