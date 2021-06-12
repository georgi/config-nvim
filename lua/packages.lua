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
  use 'onsails/lspkind-nvim'
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'haorenW1025/completion-nvim'
  use 'folke/tokyonight.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use { 'camspiers/snap', rocks = { "fzy" } }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }
  use {
   "folke/which-key.nvim",
   config = function()
     require("which-key").setup {
     }
   end
  }
  use "terrortylor/nvim-comment"
end)

require('nvim_comment').setup()
require('lspkind').init()
require'terminal'.setup()

vim.cmd[[colorscheme gruvbox-flat]]

require('lualine').setup {
  options = {
    theme = 'gruvbox-flat';
  }
}

