-- 插件快捷键keykey
local pluginKeys = {}
local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
--
local opt = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- 退出
map("n", "<leader>q", "<C-w>c", opt)
-- 保存
map("n", "<leader>w", ":w<CR>", opt)
-- 文件树
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

--- 命令中心
map("n", "<leader>p", ":Telescope commander<CR>", opt)

--- 查找
map("n", "<leader>f", "viw<cmd>lua require('spectre').open_file_search()<CR>", opt)
map("n", "<leader>F", "<cmd>lua require('spectre').open()<cr>", opt)

-- 查找文件
map("n", "<leader>g", ":Telescope find_files<CR>", opt)
map("n", "<leader>G", ":Telescope find_files hidden=true<CR>", opt)

--- 横向分屏
map("n", "<leader>d", ":vsp<CR>", opt)

-- 窗口之间跳转
map("n", "<leader>jh", "<C-w>h", opt)
map("n", "<leader>jj", "<C-w>j", opt)
map("n", "<leader>jk", "<C-w>k", opt)
map("n", "<leader>jl", "<C-w>l", opt)
--- 前进
--- 回退
map("n", "<leader>ja", "<C-o>", opt)
map("n", "<leader>jz", "<C-i>", opt)
--- 纵向分屏
map("n", "<leader>x", ":sp<CR>", opt)

map('n', '<leader>co', ':only<CR>', opt)

map('n', '<leader>b', ":Telescope marks<CR>", opt)
