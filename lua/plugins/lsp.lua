
return {
  -- Core LSP plugin
  { "neovim/nvim-lspconfig" },

  -- Mason installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason + built-in LSP
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local flags = { debounce_text_changes = 300 }

      -- Ensure the servers are installed
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "gopls", "clangd", "lua_ls", "csharp_ls" },
      })

      -- Rust
      vim.lsp.config("rust_analyzer", { flags = flags })
      vim.lsp.enable({ "rust_analyzer" })

      -- Go
      vim.lsp.config("gopls", { flags = flags })
      vim.lsp.enable({ "gopls" })

      -- C++
      vim.lsp.config("clangd", { flags = flags })
      vim.lsp.enable({ "clangd" })

      -- Lua (fix undefined global 'vim')
      vim.lsp.config("lua_ls", {
        flags = flags,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable({ "lua_ls" })

      -- C# (Roslyn)
      vim.lsp.config("csharp_ls", { flags = flags })
      vim.lsp.enable({ "csharp_ls" })
    end,
  },
}

