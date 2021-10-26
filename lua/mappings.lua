local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }

map('n', '0', '^', {})
map('n', '<leader>w', ':update<cr>', options)
map('n', '<leader>o', ':FzfLua oldfiles<cr>', options)
map('n', '<leader><leader>', ':FzfLua files<cr>', options)
map('n', '<leader>fh', ':FzfLua help_tags<cr>', options)
map('n', '<leader>fb', ':FzfLua buffers<cr>', options)
map('n', '<leader>fd', ':FzfLua command_history<cr>', options)
map('n', '<leader>fc', ':FzfLua commands<cr>', options)
map('n', '<leader>fk', ':FzfLua keymaps<cr>', options)
map('n', '<leader>fr', ':FzfLua registers<cr>', options)
map('n', '<leader>fs', ':FzfLua search_history<cr>', options)
map('n', '<leader>fz', ':FzfLua blines<cr>', options)
map('n', '<leader>lr', ':FzfLua lsp_references<cr>', options)
map('n', '<leader>ls', ':FzfLua lsp_live_workspace_symbols<cr>', options)
map('n', '<leader>fm', ':FzfLua man_pages<cr>', options)
map('n', '<leader>fg', ':FzfLua live_grep<cr>', options)

map('n', '<leader>ew', ':e <C-R>=expand("%:.:h") . "/"<CR>', { noremap = true })
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('x', 'ga', '<Plug>(EasyAlign)', options)
map('n', 'ga', '<Plug>(EasyAlign)', options)
map('x', 'p', '"0p', {})
map('x', 'P', '"0P', {})
map('x', '<C-c>', ':OSCYank<cr>', options)
map('n', 's', '<plug>(SubversiveSubstitute)', {})
map('n', 'ss', '<plug>(SubversiveSubstituteLine)', {})
map('n', 'S', '<plug>(SubversiveSubstituteToEndOfLine)', {})
map('n', '<leader>s', '<plug>(SubversiveSubstituteRange)', {})
map('x', '<leader>s', '<plug>(SubversiveSubstituteRange)', {})
map('x', '<leader>ss', '<plug>(SubversiveSubstituteWordRange)', {})
map('o', 'ie', ':exec "normal! ggVG"<cr>', { noremap = true })

map('n', 'tt', '<cmd>NvimTreeToggle<cr>', options)
map('n', 'tf', '<cmd>NvimTreeFindFile<cr>', options)

map('n', '<leader>cd', '<cmd>tcd %:p:h | pwd<cr>', options)
map("n", "<leader>xx", "<cmd>Trouble<cr>", options)
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", options)
map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", options)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", options)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", options)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", options)

map('n', '<leader>gs', '<cmd>tabnew term://git status<cr>', options)
map('n', '<leader>gl', '<cmd>tabnew term://git log<cr>', options)
map('n', '<leader>gd', '<cmd>tabnew term://git diff<cr>', options)
map('n', '<leader>gs', '<cmd>tabnew term://git --no-pager show<cr>', options)
