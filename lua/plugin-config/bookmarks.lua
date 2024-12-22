return {
  'tomasky/bookmarks.nvim',
  after = "telescope.nvim",
  event = "VimEnter",
  config = function()
    require('bookmarks').setup({
      on_attach = function(bufnr)
        local bm = require "bookmarks"
        local map = vim.keymap.set
        map("n","<leader>mm",bm.bookmark_toggle) -- add or remove bookmark at current line
        map("n","<leader>mi",bm.bookmark_ann) -- add or edit mark annotation at current line
        map("n","<leader>mc",bm.bookmark_clean) -- clean all marks in local buffer
        map("n","<leader>mn",bm.bookmark_next) -- jump to next mark in local buffer
        map("n","<leader>mp",bm.bookmark_prev) -- jump to previous mark in local buffer
        map("n","<leader>ml",":Telescope bookmarks list<CR>") -- show marked file list in quickfix window
        map("n","<leader>mx",bm.bookmark_clear_all) -- removes all bookmarks
      end
    })
  end
}
