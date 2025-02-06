local opts = {
  on_attach = function(client, buf)
    -- 禁用格式化功能，交给专门插件插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(buf, ...)
    end
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
    local wk = require("which-key")
    wk.add({
      {
        mode = "n",
        buffer = bufnr,
        { "<leader>m", group = "bookmarks", icon = { icon = " ", color = "blue" } },
        { "<leader>mm", bm.bookmark_toggle, desc = "Toggle bookmark", icon = { icon = "󰸕 ", color = "blue" } },
        { "<leader>mi", bm.bookmark_ann, desc = "Add or edit mark annotation", icon = { icon = "󰃅 ", color = "blue" } },
        { "<leader>mc", bm.bookmark_clean, desc = "Clean all marks in local buffer", icon = { icon = "󰧌 ", color = "blue" } },
        { "<leader>mn", bm.bookmark_next, desc = "Jump to next mark", icon = { icon = "󰮰 ", color = "blue" } },
        { "<leader>mp", bm.bookmark_prev, desc = "Jump to previous mark", icon = { icon = "󰮲 ", color = "blue" } },
        { "<leader>ml", ":Telescope bookmarks list<CR>", desc = "Show marked file list", icon = { icon = " ", color = "blue" } },
        { "<leader>mx", bm.bookmark_clear_all, desc = "Remove all bookmarks", icon = { icon = "󰃆 ", color = "blue" } },
      },
    })

  end,
}

return {
  on_setup = function(lspconfig)
    lspconfig.rust_analyzer.setup(opts)
  end,
}