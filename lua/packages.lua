require('packer').startup(function()
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'tpope/vim-surround'
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
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/nvim-lsp-installer'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
    use 'alvarosevilla95/luatab.nvim'
    use 'folke/tokyonight.nvim'
    use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use "folke/trouble.nvim"
    use "folke/which-key.nvim"
    use "terrortylor/nvim-comment"
    use 'chipsenkbeil/distant.nvim'
    use 'liuchengxu/vista.vim'
    use "EdenEast/nightfox.nvim"
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'windwp/nvim-autopairs'
    use 'ggandor/lightspeed.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
end)

vim.cmd[[colorscheme gruvbox-flat]]

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
require('nvim-tree').setup({})
