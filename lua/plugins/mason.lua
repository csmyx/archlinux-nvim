---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "clangd",
        "bash-language-server",

        -- install formatters
        "stylua",
        "clang-format",
        "shfmt",

        -- install debuggers
        "debugpy",
        "codelldb",

        -- install linters
        "selene",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
