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

--- 保存
map("n", "<leader>w", ":w<CR>", opt)

--- 横向分屏
map("n", "<leader>x", ":sp<CR>", opt)
--- 纵向分屏
map("n", "<leader>d", ":vsp<CR>", opt)

-- 文件树
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

--- 命令中心
map("n", "<leader>p", ":Telescope commander<CR>", opt)
--- 列出所有打开的文件
map("n", "<leader>a", ":Telescope buffers<CR>", opt)

--- 查找
map("n", "<leader>f", "viw<cmd>lua require('spectre').open_file_search()<CR>", opt)
map("n", "<leader>F", "<cmd>lua require('spectre').open()<cr>", opt)

-- 查找文件
map("n", "<leader>g", ":Telescope find_files<CR>", opt)
map("n", "<leader>G", ":Telescope find_files hidden=true<CR>", opt)


-- 窗口之间跳转
map("n", "<leader>jh", "<C-w>h", opt)
map("n", "<leader>jj", "<C-w>j", opt)
map("n", "<leader>jk", "<C-w>k", opt)
map("n", "<leader>jl", "<C-w>l", opt)

--- 前进
map("n", "<leader>jb", "<C-o>", opt)
--- 回退
map("n", "<leader>jf", "<C-i>", opt)

map("n", "<leader>lg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>lq", ":Telescope quickfix<CR>", opt)
map("n", "<leader>lj", ":Telescope jumplist<CR>", opt)
map("n", "<leader>lh", ":Telescope help_tags<CR>", opt)

map('n', '<leader>co', ':only<CR>', opt)
