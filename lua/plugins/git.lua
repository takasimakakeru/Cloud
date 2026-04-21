return {
  -- 1. Git操作の基本（:G コマンドが使えるようになる）
  {
    'tpope/vim-fugitive',
    dependencies = { 'tpope/vim-rhubarb' }, -- GitHub連携用（:GBrowseなど）
  },

  -- 2. エディタの左端に変更マーク（+ や -）を出す
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- 3. GitHub Copilot (AI補完)
  {
    'github/copilot.vim',
  },
}
