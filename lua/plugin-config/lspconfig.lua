local nvim_lsp_config = function()
  require("lsp.ui")
  local lspconfig = require("lspconfig")
  local scan = require("plenary.scandir")
  local path = require("plenary.path")

  -- Get the absolute path to the LSP config directory
  local config_path = vim.fn.stdpath("config") .. "/lua/lsp/config"
  
  -- Function to require a module safely
  local function require_safe(module)
    local ok, result = pcall(require, module)
    if not ok then
      vim.notify(
        string.format("Failed to load LSP config module: %s\nError: %s", module, result),
        vim.log.levels.ERROR
      )
      return nil
    end
    return result
  end

  -- Function to convert file path to module name
  local function path_to_module(file_path)
    -- Remove the base config path and .lua extension
    local module = file_path:gsub(config_path .. "/", ""):gsub("%.lua$", "")
    return "lsp.config." .. module
  end

  -- Scan the config directory for .lua files
  local ok, files = pcall(scan.scan_dir, config_path, { search_pattern = "%.lua$" })
  if not ok then
    vim.notify(
      string.format("Failed to scan LSP config directory: %s", config_path),
      vim.log.levels.ERROR
    )
    return
  end

  -- Load and setup each LSP config
  for _, file in ipairs(files) do
    local module_name = path_to_module(file)
    local config = require_safe(module_name)
    
    if config and type(config.on_setup) == "function" then
      -- Pass lspconfig to the on_setup function
      local setup_ok, err = pcall(config.on_setup, lspconfig)
      if not setup_ok then
        vim.notify(
          string.format("Failed to setup LSP from %s: %s", module_name, err),
          vim.log.levels.ERROR
        )
      end
    end
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for directory scanning
  },
  config = nvim_lsp_config,
  event = "VeryLazy",
  lazy = true,
}