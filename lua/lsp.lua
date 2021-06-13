local nvim_lsp = require'lspconfig'
local completion = require'completion'
local lsp_signature = require'lsp_signature'

vim.cmd[[let g:completion_enable_auto_signature = 0]]

require 'diagnosticls-nvim'.init {
}

local eslint = require 'diagnosticls-nvim.linters.eslint'
local flake8 = require 'diagnosticls-nvim.linters.flake8'
local prettier = require 'diagnosticls-nvim.formatters.prettier'
local autopep8 = require 'diagnosticls-nvim.formatters.autopep8'

require 'diagnosticls-nvim'.setup {
  ['python'] = {
    linter = flake8,
    formatter = autopep8
  },
  ['javascript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['javascriptreact'] = {
    linter = eslint,
    formatter = prettier
  }
}

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  completion.on_attach()
  lsp_signature.on_attach()

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_option('expandtab', true)
  buf_set_option('tabstop', 2)
  buf_set_option('shiftwidth', 2)

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local servers = { "pyright", "bashls", "jsonls", "tsserver", "html", "yamlls", "solargraph", "java_language_server" }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach;
        init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = false,
            closingLabels = true,
        };
    }
end

local home = os.getenv("HOME")
local sumneko_root_path = home.."/lua-language-server"
local sumneko_binary = home.."/lua-language-server/bin/macOS/lua-language-server"

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = on_attach;
  settings = {
    Lua = {
      runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';')
      },
      diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim', 'use'}
      },
      workspace = {
          -- Make the server aware of Neovim runtime files
          library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      }
    }
  }
}

