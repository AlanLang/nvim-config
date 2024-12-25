local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  on_setup = function(lspconfig)
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })
  end,
}
