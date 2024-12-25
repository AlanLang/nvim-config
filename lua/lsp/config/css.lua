return {
  on_setup = function(lspconfig)
    lspconfig.cssls.setup({
      settings = {
        css = {
          validate = true,
          -- tailwindcss
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })
  end,
}
