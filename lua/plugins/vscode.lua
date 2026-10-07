if not vim.g.vscode then return {} end

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>c"] = { function() require("vscode").action "workbench.action.closeActiveEditor" end },
          ["<Leader>q"] = { function() require("vscode").action "workbench.action.closeEditorsInGroup" end },
          ["<Leader>C"] = { "<nop>" },
          ["<Leader>Q"] = { "<nop>" },

          ["<Leader>bc"] = { function() require("vscode").action "workbench.action.closeOtherEditors" end },
          ["<Leader>bh"] = { function() require("vscode").action "workbench.action.closeEditorsToTheLeft" end },
          ["<Leader>bl"] = { function() require("vscode").action "workbench.action.closeEditorsToTheRight" end },
          ["<Leader>bp"] = { function() require("vscode").action "workbench.action.pinEditor" end },
          ["<Leader>bP"] = { function() require("vscode").action "workbench.action.unpinEditor" end },

          ["<Leader>ul"] = { function() require("vscode").action "workbench.action.toggleStatusbarVisibility" end },
          ["<Leader>ut"] = { function() require("vscode").action "workbench.action.zenShowMultipleEditorTabs" end },
          ["<Leader>uT"] = { function() require("vscode").action "workbench.action.zenHideEditorTabs" end },
          ["<Leader>ud"] = { function() require("vscode").action "errorLens.toggle" end },

          ["<Leader>ta"] = { function() require("vscode").action "editor.action.inlineSuggest.snooze" end },
          ["<Leader>lr"] = { function() require("vscode").action "editor.action.rename" end },
          ["<Leader>lR"] = { function() require("vscode").action "editor.action.goToReferences" end },
          ["]q"] = { function() require("vscode").action "editor.action.marker.next" end },
          ["[q"] = { function() require("vscode").action "editor.action.marker.prev" end },
          ["]g"] = { function() require("vscode").action "editor.action.dirtydiff.next" end },
          ["[g"] = { function() require("vscode").action "editor.action.dirtydiff.previous" end },
          ["<Leader>e"] = { function() require("vscode").action "workbench.action.toggleSidebarVisibility" end },
        },
      },
      -- disable treesitter highlighting
      treesitter = {
        highlight = false,
      },
    },
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
}
