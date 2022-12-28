require('packer').startup(function(use)
    -- Common libs
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'

    -- Color schemes
    use {'sainnhe/gruvbox-material', config = function()
        vim.cmd[[colorscheme gruvbox-material]]
    end}
    use 'ishan9299/nvim-solarized-lua'
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'monsonjeremy/onedark.nvim'
    use 'projekt0n/github-nvim-theme'
    use 'rebelot/kanagawa.nvim'
    use 'marko-cerovac/material.nvim'
    use 'shaunsingh/nord.nvim'
    use 'bluz71/vim-nightfly-guicolors'

    -- Usability
    use {'terrortylor/nvim-comment', config = function()
        require('nvim_comment').setup()
        vim.cmd [[ echom 'comment' ]]
    end}
    use {'folke/which-key.nvim', config = function()
        require('which-key').setup()
    end}
    use {'windwp/nvim-autopairs', config = function()
        require('nvim-autopairs').setup()
    end}
    use 'ggandor/lightspeed.nvim'
    use {
      "ur4ltz/surround.nvim",
      config = function()
        require"surround".setup {mappings_style = "surround"}
      end
    }
    use 'junegunn/vim-easy-align'
    use {'max397574/better-escape.nvim', config = function()
        require('better_escape').setup()
    end}
    -- use {'akinsho/toggleterm.nvim', tag = 'v1.*', config = function()
    --   require('toggleterm').setup({
    --       open_mapping = [[<C-t>]]
    --   })
    -- end}
    use "tversteeg/registers.nvim"

    -- UI Enhancements
    use 'sudormrfbin/cheatsheet.nvim'
    use {'nvim-telescope/telescope.nvim', config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        height = 0.95,
                    },
                    prompt_position = "bottom"
                }
            },
        })
    end}
    use {'kyazdani42/nvim-tree.lua', config = function()
        require('nvim-tree').setup {
            auto_reload_on_write = true,
            respect_buf_cwd = true,
            view = {
                adaptive_size = true,
                -- width = 30,
                hide_root_folder = true,
                side = 'left',
            },
        }
    end}
    use {'akinsho/bufferline.nvim', tag = 'v2.*', config = function()
        require('bufferline').setup {
            options = {
                max_name_length = 25,
                tab_size = 25,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = function()
                            return vim.fn.getcwd()
                        end,
                        highlight = "Directory",
                        text_align = "left"
                    }
                }
            }
        }
    end}
    use {'hoob3rt/lualine.nvim', config = function()
        require('lualine').setup {
            options = {
                theme = 'gruvbox-material';
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
                lualine_c = {},
                lualine_x = {'filetype'},
                lualine_y = {},
                lualine_z = {'progress'}
            },
        }
    end}

    -- LSP Support
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

    -- LSP Addons
    use 'ray-x/lsp_signature.nvim'
    use 'onsails/lspkind.nvim'
    -- use 'liuchengxu/vista.vim'
    use {'simrat39/symbols-outline.nvim', config = function()
        require('symbols-outline').setup()
    end}
    use {'folke/trouble.nvim', config = function()
        require('trouble').setup {}
    end}
    use 'github/copilot.vim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { 'php', 'lua', 'javascript', 'css', 'bash', 'python', 'html' },
            sync_install = false,
            refactor = {
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = 'grr',
                    },
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ab'] = '@block.outer',
                        ['ib'] = '@block.inner',
                        ['ac'] = '@call.outer',
                        ['ic'] = '@call.inner',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
            },
        }
    end}
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-refactor'

    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('null-ls').setup()
        end
    })
    use({
        'aserowy/tmux.nvim',
        config = function()
            require('tmux').setup({
                copy_sync = {
                    -- enables copy sync and overwrites all register actions to
                    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                    enable = true,
                },
            })
        end
    })

    use 'vimpostor/vim-tpipeline'
end)



