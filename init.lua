require'packages'
require'options'
require'lsp'
require'treesitter'
require'mappings'

vim.cmd[[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.g.nvim_tree_width = 0.3
vim.g.nvim_tree_highlight_opened_files = 1

vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]

vim.cmd[[autocmd FileType lua setlocal shiftwidth=4 softtabstop=4 tabstop=8]]
vim.cmd[[
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
call wilder#set_option('modes', ['/', '?', ':'])
]]
vim.cmd[[
call wilder#set_option('renderer', wilder#wildmenu_renderer({ 'highlighter': wilder#basic_highlighter() }))
]]

vim.cmd[[
call wilder#set_option('pipeline', [ wilder#branch( wilder#cmdline_pipeline({ 'language': 'python', 'fuzzy': 1, }), wilder#python_search_pipeline({ 'pattern': wilder#python_fuzzy_pattern(), 'sorter': wilder#python_difflib_sorter(), 'engine': 're', }),), ])
]]

