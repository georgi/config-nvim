require'packages'
require'options'
require'lsp'
require'mappings'

vim.cmd[[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]

vim.cmd[[autocmd BufWritePre * :%s/\s\+$//e]]
vim.cmd[[autocmd FileType lua setlocal shiftwidth=4 softtabstop=4 tabstop=8]]
vim.cmd[[autocmd BufRead,BufNewFile *.kbd set filetype=kbd]]

require('telescope').setup({
    defaults = {
        layout_strategy = "bottom_pane",
        layout_config = {
            prompt_position = "bottom"
        }
    },
})

vim.g.gruvbox_flat_style = "hard"

vim.cmd[[colorscheme gruvbox-flat]]

