require('packer').startup(function()
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'monsonjeremy/onedark.nvim'
    use 'projekt0n/github-nvim-theme'
    use "rebelot/kanagawa.nvim"
    use 'marko-cerovac/material.nvim'
    use 'shaunsingh/nord.nvim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use 'kyazdani42/nvim-tree.lua'
    use 'ray-x/lsp_signature.nvim'
    use 'junegunn/vim-easy-align'
    use 'svermeulen/vim-subversive'
    use 'norcalli/nvim-terminal.lua'
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
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
       use 'liuchengxu/vista.vim'
    use 'folke/tokyonight.nvim'
    use "EdenEast/nightfox.nvim"
    use 'nvim-telescope/telescope.nvim'
    -- use 'gelguy/wilder.nvim'
    use 'hoob3rt/lualine.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use "folke/trouble.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "folke/which-key.nvim"
    use "terrortylor/nvim-comment"
    use 'nvim-lua/plenary.nvim'
    use 'windwp/nvim-autopairs'
    use 'ggandor/lightspeed.nvim'

    use {'akinsho/bufferline.nvim', tag = "v2.*"}

    use { "/usr/share/fb-editor-support/nvim", as = "meta.nvim" }
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end
    })
    use({
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup({
                copy_sync = {
                    -- enables copy sync and overwrites all register actions to
                    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                    enable = true,
                },
            })
        end
    })
end)

vim.cmd[[colorscheme gruvbox-flat]]

require('lualine').setup {
    options = {
        theme = 'gruvbox-flat';
    }
}

require('nvim-autopairs').setup{}
require("bufferline").setup{}
require("which-key").setup {}
require('nvim_comment').setup()
require("trouble").setup {}
require('terminal').setup()
require('nvim-tree').setup {}

require'nvim-tree'.setup {
  auto_reload_on_write = true,
  view = {
    width = 80,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = true,
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "c",
      "cpp",
      "php",
      "lua",
      "java",
      "javascript",
      "make",
      "ruby",
      "css",
      "bash",
      "python",
      "html"
  },
  sync_install = false,
}
