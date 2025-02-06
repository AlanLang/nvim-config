-- 自定义图标
vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  signs = true,
  update_in_insert = false,
  underline = true,
  show_header = false,
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
    style = "minimal",
    header = "",
    -- prefix = " ",
    -- max_width = 100,
    -- width = 60,
    -- height = 20,
  },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    local wk = require("which-key")
    wk.add({
      {
        mode = "n",
        buffer = ev.buf,
        { "gr", ":Telescope lsp_references <CR>", desc = "Show references", icon = { icon = " ", color = "blue" } },
        { "gd", ":Telescope lsp_definitions <CR>", desc = "Show definitions", icon = { icon = " ", color = "blue" } },
        { "<leader>c", group = "Code LSP Commands", icon = { icon = " ", color = "blue" } },
        { "<leader>ch", vim.lsp.buf.signature_help, desc = "Show signature help", icon = { icon = " ", color = "blue" } },
        { "<leader>co", vim.lsp.buf.hover, desc = "Show hover", icon = { icon = " ", color = "blue" } },
        { "<leader>ct", vim.lsp.buf.type_definition, desc = "Show type definition", icon = { icon = " ", color = "blue" } },
        { "<leader>ci", vim.lsp.buf.implementation, desc = "Show implementation", icon = { icon = " ", color = "blue" } },
        { "<leader>cn", vim.lsp.buf.rename, desc = "Rename", icon = { icon = " ", color = "blue" } },
        { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action", icon = { icon = " ", color = "blue" } },
        { "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show diagnostic", icon = { icon = " ", color = "blue" } },
        { "<leader>cp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous diagnostic", icon = { icon = " ", color = "blue" } },
        { "<leader>cn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next diagnostic", icon = { icon = " ", color = "blue" } },
      },
    })
  end,
})