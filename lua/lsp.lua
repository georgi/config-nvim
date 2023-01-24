local lspconfig = require'lspconfig'
local lsp = require('lsp-zero')
local lspkind = require('lspkind')
local null_ls = require('null-ls')

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
    bind('n', '<space>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    bind('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    bind('n', '<space>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    bind('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    bind('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    bind("n", "<space>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
    "bashls",
    "jsonls",
    "gopls",
    "html",
    "yamlls",
    -- "pyright",
    "pylsp",
    "tsserver",
    "ocamlls",
    "elmls",
    "gdscript"
}


for _, name in ipairs(servers) do
  lspconfig[name].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end


null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.diagnostics.mypy,
    },
})
