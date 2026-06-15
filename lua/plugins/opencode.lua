return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    lazy = false,
    config = function()
      local opencode_cmd = "opencode --port"

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          -- Use toggleterm in tab mode for the opencode TUI
          start = function()
            local astro = require "astrocore"
            astro.toggle_term_cmd { cmd = opencode_cmd, direction = "tab" }
          end,
        },
      }

      vim.o.autoread = true

      -- Show the opencode terminal when a prompt is submitted
      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent:tui.command.execute",
        callback = function(args)
          ---@type opencode.server.Event
          local event = args.data.event
          if event.properties.command == "prompt.submit" then
            local terms = require("toggleterm.terminal")
            for _, term in ipairs(terms.get_all()) do
              if term.dir and term.cmd == opencode_cmd then
                term:focus()
                break
              end
            end
          end
        end,
      })

      -- Normal mode: ask about current buffer (file)
      vim.keymap.set("n", "<leader>oa", function()
        require("opencode").ask("@buffer: ")
      end, { desc = "OpenCode: ask (buffer)" })

      -- Visual mode: ask about selected lines
      vim.keymap.set("x", "<leader>oa", function()
        require("opencode").ask("@this: ")
      end, { desc = "OpenCode: ask (selection)" })

      -- Select from prompts, commands, servers
      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "OpenCode: select" })

      -- Vim-y operators: append range/line to opencode
      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "OpenCode: append range", expr = true })

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "OpenCode: append line", expr = true })
    end,
  },
}
