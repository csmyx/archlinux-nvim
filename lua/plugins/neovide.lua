if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      o = {
        -- configure font
        --
        -- these two are non-mono icons:
        -- guifont = "Maple Mono NF" .. ":h16",
        guifont = "JetBrains Maple Mono" .. ":h17",
        --
        -- this one is mono icons:
        -- guifont = "JetBrainsMono Nerd Font Mono" .. ",Maple Mono NF" .. ":h17",
      },
      opt = { -- configure vim.opt options
        -- line spacing
        linespace = 0,
      },
      g = { -- configure vim.g variables
        -- configure scaling
        neovide_scale_factor = 1.0,
        -- configure padding
        neovide_padding_top = 0,
        neovide_padding_bottom = 0,
        neovide_padding_right = 0,
        neovide_padding_left = 0,
        neovide_fullscreen = true,
        neovide_opacity = 0.8,
        neovide_normal_opacity = 0.8,
      },
    },
  },
}
