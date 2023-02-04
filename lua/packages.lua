require("lazy").setup({
  "folke/which-key.nvim",
  'folke/tokyonight.nvim',
  'ishan9299/nvim-solarized-lua',
  'kyazdani42/nvim-web-devicons',
  'junegunn/vim-easy-align',
  {'terrortylor/nvim-comment', lazy = false, config  = function()
    require('nvim_comment').setup()
  end},
  {'windwp/nvim-autopairs', lazy = false},
  {'max397574/better-escape.nvim', lazy = false},
  {"tversteeg/registers.nvim", lazy = false},
  'ggandor/lightspeed.nvim',
  {'nvim-telescope/telescope.nvim', config = function()
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
  end},
  {'kyazdani42/nvim-tree.lua', config = function()
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
  end},
  {'akinsho/bufferline.nvim', config = function()
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
  end},
  {'hoob3rt/lualine.nvim', config = function()
    require('lualine').setup {
      options = {
        -- theme = 'gruvbox-material';
        theme = 'nightfly';
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'aerial'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'progress'}
      },
    }
  end},
  {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
          require("lsp_lines").setup()
          vim.diagnostic.config({
              virtual_text = false,
              virtual_lines = false
          })
      end,
  },
  {'akinsho/toggleterm.nvim', config = function()
    require('toggleterm').setup({
      open_mapping = [[<C-t>]]
    })
  end},
  {
    "ur4ltz/surround.nvim", config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  },
  'ray-x/lsp_signature.nvim',
  'onsails/lspkind.nvim',
  'folke/trouble.nvim',
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   dependencies = {
  --     -- LSP Support
  --     'neovim/nvim-lspconfig',
  --     'williamboman/nvim-lsp-installer',
  --     -- Autocompletion
  --     'hrsh7th/nvim-cmp',
  --     -- 'hrsh7th/cmp-buffer',
  --     -- 'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-nvim-lua',
  --   }
  -- },
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  {'hrsh7th/nvim-cmp', config = function()
    local cmp = require'cmp'
    local lspkind = require('lspkind')
    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
      },
      mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        }),
      },
      sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
      }),
      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          require("copilot_cmp.comparators").score,

          -- Below is the default comparitor list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    local on_attach = function(_, bufnr)
      local opts = {buffer = bufnr, remap = false}
      local bind = vim.keymap.set

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      bind('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      bind('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      bind('n', '<space>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      bind('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      bind('n', '<space>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      bind('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      bind('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      bind("n", "<space>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
    end
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local servers = {
      "bashls",
      "jsonls",
      "sumneko_lua",
      "html",
      "yamlls",
      "pyright",
      "tsserver",
    }
    for _, name in ipairs(servers) do
      lspconfig[name].setup {
        on_attach = on_attach,
        capabilities = capabilities
      }
    end
  end},
  { "zbirenbaum/copilot.lua", config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-]>",
          }
        },
        panel = { enabled = false },
      })
  end},
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup({
        method = "getPanelCompletions",
      })
      local lspkind = require("lspkind")
      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
    end,
    lazy = false
  },
  'vim-test/vim-test',
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function()
    require'nvim-treesitter.configs'.setup {
      -- ensure_installed = { 'php', 'lua', 'javascript', 'css', 'bash', 'python', 'html' },
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
  end},
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-refactor',
  {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup({
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end
    }) end
  },
  'jose-elias-alvarez/null-ls.nvim',
  {
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
  },
  'vimpostor/vim-tpipeline'
})
