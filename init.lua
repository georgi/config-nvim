local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require'options'
require'packages'
require'mappings'

vim.cmd[[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent on]]

vim.cmd[[autocmd BufWritePre * :%s/\s\+$//e]]
vim.cmd[[autocmd BufRead,BufNewFile *.kbd set filetype=kbd]]
vim.cmd[[autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))]]
vim.cmd[[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 tabstop=2]]
vim.cmd[[autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2]]
vim.cmd[[autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2]]

-- Only load font in GUI
-- vim.cmd[[call rpcnotify(1, 'Gui', 'Font', 'FiraCode 13')]]

vim.g.tpipeline_autoembed = 0
vim.g.gruvbox_flat_style = "hard"
vim.cmd[[colorscheme tokyonight]]
