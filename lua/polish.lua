-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- vim.g.background = "dark"

-- quickfix / location 窗口默认在右侧打开（覆盖 :copen、grug-far、LSP references 等所有来源）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function() vim.cmd.wincmd "L" end,
})
