require'packages'
require'options'
require'lsp'
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

vim.g.tpipeline_autoembed = 0
vim.g.gruvbox_flat_style = "hard"
vim.cmd[[colorscheme tokyonight]]

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

function Fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())

  if num_selections > 1 then
    picker = action_state.get_current_picker(prompt_bufnr)
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format("%s %s", ":e!", entry.value))
    end
    vim.cmd('stopinsert')
  else
    actions.file_edit(prompt_bufnr)
  end
end

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<cr>'] = Fzf_multi_select,
      },
      n = {
        ['<esc>'] = actions.close,
        ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
        ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
        ['<cr>'] = Fzf_multi_select
      }
    },
  }
}
