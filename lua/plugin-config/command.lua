local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

local command_center_config = function()
  local command_center = require("commander")
  command_center.add({
    {
      desc = "marks list all",
      cmd = "<cmd>MarksListAll<CR>"
    }
  })
end

return {
  "FeiyouG/commander.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = command_center_config,
  lazy = true,
  cmd = "Telescope command_center",
}
