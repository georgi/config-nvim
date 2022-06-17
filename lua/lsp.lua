local lspconfig = require'lspconfig'
local null_ls = require("null-ls")
local lsp = require('lsp-zero')
local lspkind = require('lspkind')
lsp.preset('recommended')
lsp.setup_nvim_cmp({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' }
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  }
})
lsp.nvim_workspace()
lsp.setup()

local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    bind('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    bind('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    bind('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    bind('n', '<space>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    bind('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    bind('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    bind("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { "hhvm", "pyls@meta", "pyre@meta", "thriftlsp@meta" }

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


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
--
-- local flake8 = {
--     lintCommand = 'flake8 --stdin-display-name "${INPUT}" -',
--     lintStdin = true,
--     lintFormats = {'%f:%l:%c: %m'}
-- }
--
--
-- local prettier = {
--     formatCommand = 'prettier --stdin --stdin-filepath "${INPUT}"',
--     formatStdin = true
-- }
--
-- local eslint = {
--     lintCommand = 'eslint -f visualstudio --stdin --stdin-filename "${INPUT}"',
--     lintIgnoreExitCode = true,
--     lintStdin = true,
--     lintFormats = {
--         "%f(%l,%c): %tarning %m",
--         "%f(%l,%c): %rror %m"
--     }
-- }
--
-- local black = {
--     formatCommand = 'black --quiet -',
--     formatStdin = true
-- }
--
-- local isort = {
--     formatCommand = 'isort --quiet -',
--     formatStdin = true
-- }
--
