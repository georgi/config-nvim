require('packer').startup(function()
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-tbone'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'kyazdani42/nvim-tree.lua'
  use 'ray-x/lsp_signature.nvim'
  use 'ojroques/vim-oscyank'
  use 'junegunn/vim-easy-align'
  use 'svermeulen/vim-subversive'
  use 'norcalli/nvim-terminal.lua'
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'creativenull/diagnosticls-nvim'
  use 'haorenW1025/completion-nvim'
  use 'folke/tokyonight.nvim'
  use 'vijaymarupudi/nvim-fzf'
  use 'ibhagwan/fzf-lua'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use "folke/which-key.nvim"
  use "terrortylor/nvim-comment"
end)

vim.cmd[[colorscheme gruvbox-flat]]

require'fzf-lua'.setup {
  preview_layout = 'vertical'
}
require('lualine').setup {
  options = {
    theme = 'gruvbox-flat';
  }
}
require("which-key").setup {}
require('nvim_comment').setup()
require("trouble").setup {}
require'terminal'.setup()
require('lspkind').init()
