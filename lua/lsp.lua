local nvim_lsp = require'lspconfig'
local lsp_signature = require'lsp_signature'
local home = os.getenv('HOME')
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

-- use lsp_signature instead of native signature ui
vim.g.completion_enable_auto_signature = false

require 'vim.lsp.log'.set_level("trace")

local cmp = require'cmp'
local cmp_nvim_lsp = require('cmp_nvim_lsp')

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- completion.on_attach()
    lsp_signature.on_attach()

    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<spacekwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())<CR>', opts)
    buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    --   -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

local servers = {
    "bashls",
    "jsonls",
    "gopls",
    "html",
    "yamlls",
    "pyright",
    "tsserver",
    "ocamlls",
    "elmls",
    "gdscript"
}


for _, s in ipairs(servers) do
    nvim_lsp[s].setup({
        on_attach = on_attach,
        capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })
end

local flake8 = {
    lintCommand = 'flake8 --stdin-display-name "${INPUT}" -',
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'}
}


local prettier = {
    formatCommand = 'prettier --stdin --stdin-filepath "${INPUT}"',
    formatStdin = true
}

local eslint = {
    lintCommand = 'eslint -f visualstudio --stdin --stdin-filename "${INPUT}"',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {
        "%f(%l,%c): %tarning %m",
        "%f(%l,%c): %rror %m"
    }
}

local black = {
    formatCommand = 'black --quiet -',
    formatStdin = true
}

local isort = {
    formatCommand = 'isort --quiet -',
    formatStdin = true
}

nvim_lsp.efm.setup({
    -- cmd = { "efm-langserver", "-logfile", "/tmp/efm.log" },
    on_attach = on_attach,
    init_options = {
        documentFormatting = true,
        codeAction = true
    },
    filetypes = { 'python', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    settings = {
        log_level = 1,
        log_file = '~/efm.log',
        rootMarkers = { ".git/", ".hg/" },
        languages = {
            python = { flake8, black, isort },
            javascript = { eslint, prettier },
            javascriptreact = { eslint, prettier },
            typescript = { eslint, prettier },
            typescriptreact = { eslint, prettier }
        }
    },
})

nvim_lsp.sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
})

