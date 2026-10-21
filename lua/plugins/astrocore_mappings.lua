-- 全局（跨文件）循环引用跳转：首次按键将 LSP references 收集进 quickfix，之后在列表内循环
local refs_pending = false
local function global_ref_jump(dir)
  local count = vim.v.count1
  local win = vim.api.nvim_get_current_win()
  local function jump_to(idx)
    vim.api.nvim_set_current_win(win)
    vim.cmd("cc" .. idx)
  end
  local qf = vim.fn.getqflist { idx = 0, size = 0, title = 0 }
  local is_refs = qf.title and qf.title:find("References", 1, true)
  if is_refs and qf.size > 0 then
    local cur = qf.idx or 0
    jump_to((((cur + dir * count - 1) % qf.size) + 1))
  elseif not refs_pending then
    refs_pending = true
    vim.lsp.buf.references(nil, {
      on_list = function(list)
        refs_pending = false
        vim.fn.setqflist({}, " ", list)
        vim.cmd "botright copen"
        local size = #list.items
        local idx = dir > 0 and math.min(count, size) or math.max(size - count + 1, 1)
        jump_to(idx)
      end,
    })
  end
end

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

          -- 全局替换（当前文件，逐个确认）：自动展开为 :%s///gcI，光标停在第一个 / 后
          ["<Leader>rr"] = { ":%s///gcI<Left><Left><Left><Left><Left>", desc = "Replace in file (confirm)" },
          -- Save without triggering auto-format (one-shot, keeps the global/buffer auto-format toggles untouched)
          ["<Leader>W"] = {
            function()
              local prev_astrolsp, prev_conform = vim.b.autoformat, vim.b.disable_autoformat
              vim.b.autoformat = false
              vim.b.disable_autoformat = true
              vim.cmd.write()
              vim.b.autoformat = prev_astrolsp
              vim.b.disable_autoformat = prev_conform
            end,
            desc = "Save without format",
          },
          -- 禁用内置 K 键（keyword lookup，默认调 man），防止误触
          -- ["K"] = { "<Nop>", desc = "disabled (was: keyword lookup/man)" },
          -- 引用跳转循环化（snacks.words 自带 cycle 参数，覆盖 AstroNvim 默认的非循环版本）
          ["]r"] = { function() require("snacks").words.jump(vim.v.count1, true) end, desc = "Next reference (cyclic)" },
          ["[r"] = {
            function() require("snacks").words.jump(-vim.v.count1, true) end,
            desc = "Previous reference (cyclic)",
          },
          -- quickfix 循环跳转（覆盖 nvim 内置 ]q/[q 到末尾报 E553 的行为）
          ["]q"] = {
            function()
              local qf = vim.fn.getqflist { idx = 0, size = 0 }
              if not qf or qf.size == 0 then
                vim.notify("Quickfix list is empty", vim.log.levels.WARN, { title = "Quickfix" })
                return
              end
              vim.cmd("cc" .. (((qf.idx or 0) + vim.v.count1 - 1) % qf.size + 1))
            end,
            desc = "Next quickfix (cyclic)",
          },
          ["[q"] = {
            function()
              local qf = vim.fn.getqflist { idx = 0, size = 0 }
              if not qf or qf.size == 0 then
                vim.notify("Quickfix list is empty", vim.log.levels.WARN, { title = "Quickfix" })
                return
              end
              vim.cmd("cc" .. (((qf.idx or 0) - vim.v.count1 - 1) % qf.size + 1))
            end,
            desc = "Previous quickfix (cyclic)",
          },
          -- Alt+n/p 同 ]r/[r 的循环引用跳转
          ["<A-n>"] = {
            function() require("snacks").words.jump(vim.v.count1, true) end,
            desc = "Next reference (cyclic)",
          },
          ["<A-p>"] = {
            function() require("snacks").words.jump(-vim.v.count1, true) end,
            desc = "Previous reference (cyclic)",
          },
          -- 全局（跨文件）循环引用跳转
          ["]R"] = { function() global_ref_jump(1) end, desc = "Next reference (global, cyclic)" },
          ["[R"] = { function() global_ref_jump(-1) end, desc = "Previous reference (global, cyclic)" },
          ["<A-N>"] = { function() global_ref_jump(1) end, desc = "Next reference (global, cyclic)" },
          ["<A-P>"] = { function() global_ref_jump(-1) end, desc = "Previous reference (global, cyclic)" },
          -- 保留当前窗口，关闭其他所有窗口（:only）
          ["<A-q>"] = { "<C-w>o", desc = "Close all other windows" },
          -- Alt+m/M 同 vim 内置 ]}/[{ 的花括号块跳转
          ["<A-m>"] = { "]}", desc = "Next unmatched brace" },
          ["<A-M>"] = { "[{", desc = "Previous unmatched brace" },
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
          ["K"] = { "<Nop>", desc = "disabled (was: keyword lookup/man)" },
        },
        x = {
          -- 选区替换：vim 进入命令行时会自动补上 '<,'> 范围，只需输入 s/a/b/g
          ["<Leader>rr"] = { ":s///gcI<Left><Left><Left><Left><Left>", desc = "Replace in selection (confirm)" },
          -- grug-far 在选中行范围内查找关键词（选中文本不作为关键词，范围限定为选区行区间）
          ["<Leader>S"] = { ":GrugFarWithin<CR>", desc = "Search/Replace in selection range" },
          -- 视觉模式同样禁用 K（keyword lookup）
          -- ["K"] = { "<Nop>", desc = "disabled (was: keyword lookup/man)" },
        },
        i = {},
        t = {
          ["<A-n>"] = { "<C-\\><C-n>", desc = "Return to normal mode in terminal" },
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
