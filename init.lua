require'packages'
require'options'
require'lsp'
require'treesitter'
require'mappings'

vim.cmd[[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.g.nvim_tree_width = 30
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '__pycache__'}

vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]

vim.cmd[[autocmd BufWritePre * :%s/\s\+$//e]]
vim.cmd[[autocmd FileType lua setlocal shiftwidth=4 softtabstop=4 tabstop=8]]

-- vim.cmd[[
-- call wilder#enable_cmdline_enter()
-- set wildcharm=<Tab>
-- cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
-- cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
-- call wilder#set_option('modes', ['/', '?', ':'])
-- ]]
-- vim.cmd[[
-- call wilder#set_option('renderer', wilder#wildmenu_renderer({ 'highlighter': wilder#basic_highlighter() }))
-- ]]
