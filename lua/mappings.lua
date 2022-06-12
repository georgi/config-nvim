local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }

map('n', '<C-h>', ':BufferLineCyclePrev<cr>', options)
map('n', '<C-j>', ':BufferLineCycleNext<cr>', options)

map('n', '<leader>w', ':update<cr>', options)
map('n', '<leader>q', ':bp|bd #<cr>', options)  -- do not change window split
map('n', '<leader><leader>', ':Telescope oldfiles<cr>', options)
map('n', '<leader>j', ':BufferLineCyclePrev<cr>', options)
map('n', '<leader>k', ':BufferLineCycleNext<cr>', options)
map('n', '<leader>v', ':Vista nvim_lsp<cr>', options)
map('n', '<leader>b', ':Telescope buffers<cr>', options)
map('n', '<leader>t', ':Telescope treesitter<cr>', options)
map('n', '<leader>f', ':Telescope find_files<cr>', options)
map('n', '<leader>e', ':e <C-R>=expand("%:.:h") . "/"<CR>', { noremap = true })
map('n', '<leader>r', ':Telescope registers<cr>', options)
map('n', '<leader>h', ':Telescope help_tags<cr>', options)
map('n', '<leader>c', ':Telescope command_history<cr>', options)
-- map('n', '<leader>cm', ':Telescope commands<cr>', options)
-- map('n', '<leader>km', ':Telescope keymaps<cr>', options)

map('n', '<leader>s', ':Telescope search_history<cr>', options)
map('n', '<leader>l', ':Telescope lsp_workspace_symbols<cr>', options)
map('n', '<leader>m', ':Telescope man_pages<cr>', options)
map('n', '<leader>g', ':Telescope live_grep<cr>', options)

map('n', 'gb', ':BufferLinePick<cr>', options)
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('x', 'ga', '<Plug>(EasyAlign)', options)
map('n', 'ga', '<Plug>(EasyAlign)', options)
map('x', 'p', '"_dP', options) -- first deletes to the black hole

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
