local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }

map('n', '0', '^', {})

map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('x', 'ga', '<Plug>(EasyAlign)', options)
map('n', 'ga', '<Plug>(EasyAlign)', options)
map('x', 'p', '"0p', options)
map('x', 'P', '"0P', options)
map('x', '<C-c>', ':OSCYank<cr>', options)
map('n', 's', '<plug>(SubversiveSubstitute)', options)
map('n', 'ss', '<plug>(SubversiveSubstituteLine)', options)
map('n', 'S', '<plug>(SubversiveSubstituteToEndOfLine)', options)

map('n', 'tt', '<cmd>NvimTreeToggle<cr>', options)
map('n', 'tn', '<cmd>tabnext<cr>', options)
map('n', 'tb', '<cmd>tabnew<cr>', options)
map('n', 'tc', '<cmd>tabclose<cr>', options)
map('n', 'te', '<cmd>tabedit<cr>', options)
map('n', 'td', '<cmd>tabdo<cr>', options)

map('n', '<leader>cd', '<cmd>cd %:p:h | pwd<cr>', options)
map("n", "<leader>xx", "<cmd>Trouble<cr>", options)
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", options)
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", options)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", options)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", options)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", options)

map('i', '<TAB>', '<Plug>(completion_smart_tab)', {})
map('i', '<S-TAB>', '<Plug>(completion_smart_s_tab)', {})

