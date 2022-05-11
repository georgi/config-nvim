local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }

map('n', '0', '^', {})

map('n', '<leader>w', ':update<cr>', options)
map('n', '<leader>o', ':Telescope oldfiles<cr>', options)
map('n', '<leader><leader>', ':Telescope buffers<cr>', options)
map('n', '<leader>v', ':Vista nvim_lsp<cr>', options)
map('n', '<leader>t', ':Telescope treesitter<cr>', options)
map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fh', ':Telescope help_tags<cr>', options)
map('n', '<leader>fd', ':Telescope command_history<cr>', options)
map('n', '<leader>fc', ':Telescope commands<cr>', options)
map('n', '<leader>fk', ':Telescope keymaps<cr>', options)
map('n', '<leader>tr', ':Telescope registers<cr>', options)
map('n', '<leader>ts', ':Telescope search_history<cr>', options)
map('n', '<leader>ld', ':Telescope lsp_definitions<cr>', options)
map('n', '<leader>li', ':Telescope lsp_implementations<cr>', options)
map('n', '<leader>lr', ':Telescope lsp_references<cr>', options)
map('n', '<leader>ls', ':Telescope lsp_workspace_symbols<cr>', options)
map('n', '<leader>fm', ':Telescope man_pages<cr>', options)

map('n', '<leader>ew', ':e <C-R>=expand("%:.:h") . "/"<CR>', { noremap = true })
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('x', 'ga', '<Plug>(EasyAlign)', options)
map('n', 'ga', '<Plug>(EasyAlign)', options)
map('x', '<C-c>', ':OSCYank<cr>', options)
-- map('n', 's', '<plug>(SubversiveSubstitute)', {})
-- map('n', 'ss', '<plug>(SubversiveSubstituteLine)', {})
-- map('n', 'S', '<plug>(SubversiveSubstituteToEndOfLine)', {})
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
