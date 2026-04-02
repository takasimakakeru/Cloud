
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- 先にエディタの基本設定を済ませる（エラー回避のため）
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
-- エンコーディング系はエラーが出やすいので、必要なものだけに絞る
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- プラグイン設定
require("lazy").setup({
  "mattn/emmet-vim",
  "folke/tokyonight.nvim",
  "nvim-treesitter/nvim-treesitter",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons" }
})

-- プラグイン読み込み後の設定
vim.cmd("colorscheme tokyonight")
require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- nvim-treeの設定
local status, nvimtree = pcall(require, "nvim-tree")
if status then
  nvimtree.setup({
    view = { width = 30, side = "left" },
    filters = { dotfiles = false }
  })
  vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { silent = true })
end

