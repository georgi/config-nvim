local nvim_lsp = require'lspconfig'
local completion = require'completion'
local lsp_signature = require'lsp_signature'
local configs = require 'lspconfig/configs'
local home = os.getenv('HOME')

-- use lsp_signature instead of native signature ui
vim.g.completion_enable_auto_signature = false

-- require 'vim.lsp.log'.set_level("trace")

local aurora = {
  sourceName = 'aurora',
  command = home..'.config/nvim/bin/aurora.sh',
  debounce = 100,
  args = { '%filepath' },
  formatLines = 1,
  parseJson = {
    errorsRoot = "errors",
    line = "line",
    column = "char",
    security = "severity",
    message = "${description} ${code} [${name}]"
  },
  securities = {
    error = 'error',
    warning = 'warning',
  },
}


local eslint = {
  sourceName = 'eslint',
  command = 'eslint',
  debounce = 100,
  args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'compact' },
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[.*: line (\d+), col (\d+), (\w+) (.*)(\r|\n)*$]],
    {
      line = 1,
      column = 2,
      security = 3,
      message = 4,
    },
  },
  securities = {
    Error = 'error',
    Warning = 'warning',
  },
}

local pyre = {
  sourceName = 'pyre',
  command = 'pyre',
  args = {'-l', '%filepath', '--output', 'json'},
  debounce = 1000,
  parseJson = {
    sourceName = "path",
    sourceNameFilter = true,
    line = "line",
    column = "column",
    endColumn = "stop_column",
    endLine = "stop_line",
    message = "${description} ${code} [${name}]"
  },
  securities = {
  },
}

local flake8 = {
  sourceName = 'flake8',
  command = '/usr/local/bin/flake8',
  args = {'-'},
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[.*:(\d+):(\d+): ([A-Z]\d+) (.*)(\r|\n)*$]],
    {
      line = 1,
      column = 2,
      security = 3,
      message = 4,
    },
  },
  securities = {
    W = 'warning',
    E = 'error',
    F = 'error',
    C = 'error',
    N = 'error',
  },
}

local prettier = {
  sourceName = 'prettier',
  command = 'prettier',
  args = { '--stdin', '--stdin-filepath', '%filepath' },
  rootPatterns = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
  },
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
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<spacekwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

local servers = { "bashls", "jsonls", "html", "yamlls", "pyright" }

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

configs.hack = {
  default_config = {
    cmd = {"hh_client", "lsp", "--from", "vim"};
    filetypes = {"php"};
    root_dir = function(fname)
      return home.."/www"
    end;
  };
};

nvim_lsp.diagnosticls.setup {
  filetypes = {"python", "javascript", "javascriptreact", "hack"},
  cmd = {"node", home.."/diagnostic-languageserver/bin", "--stdio", "--log-level", "4"},
  init_options = {
    filetypes = {
      python = {"flake8", "pyre"},
      javascript = "eslint",
      javascriptreact = "eslint",
      hack = "aurora"
    },
    formatFiletypes = {
      javascript = "prettier",
      javascriptreact = "prettier",
     },
    linters = {
      flake8 = flake8,
      pyre = pyre,
      eslint = eslint,
      aurora = aurora
    },
    formatters = {
      prettier = prettier
    },
  },
}

nvim_lsp.hack.setup {
  on_attach = on_attach;
}

nvim_lsp.flow.setup {
  cmd = {"flow", "lsp"};
  root_dir = function(fname)
    return home.."/www"
  end;
  on_attach = on_attach;
}


local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = home..'/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'use'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
