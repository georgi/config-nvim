require'packages'
require'options'
require'lsp'
require'treesitter'
require'mappings'
require'snaps'

vim.cmd[[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.g.nvim_tree_width = 40
vim.g.nvim_tree_highlight_opened_files = 1

vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]
