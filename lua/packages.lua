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
    use 'creativenull/diagnosticls-nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'alvarosevilla95/luatab.nvim'
    use 'folke/tokyonight.nvim'
    -- use 'gelguy/wilder.nvim'
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

-- require'fzf-lua'.setup {
--     winopts = {
--         preview = {
--             horizontal = 'right:50%',
--             flip_columns = 200,
--         },
--         height = 0.95,
--         width = 0.95,
--         border = true,
--     }
-- }
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
