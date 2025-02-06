local mason_lsp_config = function()
  require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
      "ts_ls",
      "tailwindcss",
      "cssls",
      "rust_analyzer",
      "biome"
    },
  })
end

return {
  "williamboman/mason-lspconfig.nvim",
  config = mason_lsp_config,
  lazy = true,
  event = "VeryLazy"
}
