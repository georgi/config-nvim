local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true, silent = true }

vim.g.copilot_no_tab_map = true
vim.keymap.set(
    "i",
    "<Plug>(vimrc:copilot-dummy-map)",
    'copilot#Accept("")',
    { silent = true, expr = true, desc = "Copilot dummy accept" }
)

local cmp = require("cmp")
cmp.setup {
  mapping = {
    ['<C-l>'] = cmp.mapping(function(_)
      vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
    end)
  },
}

map('i', '<C-Space>', '<Plug>(copilot-suggest)', { silent = true })
-- map('i', '<C-k>', '<Plug>(copilot-next)', { silent = true })
-- map('i', '<C-j>', '<Plug>(copilot-dismiss)', { silent = true })
map('t', '<C-o>', '<C-\\><C-n>', { silent = true })

map('n', '<leader>p', ':BufferLineCyclePrev<cr>', options)
map('n', '<leader>n', ':BufferLineCycleNext<cr>', options)

map('n', '<leader>w', ':update<cr>', options)
map('n', '<leader>q', ':bp|bd #<cr>', options)  -- do not change window split
map('n', '<leader>d', ':bd<cr>', options)  -- do not change window split

map('n', '<leader><leader>', ':Telescope oldfiles<cr>', options)

map('n', '<leader>b', ':Telescope buffers<cr>', options)
map('n', '<leader>o', ':AerialToggle!<cr>', options)
map('n', '<leader>f', ':Telescope find_files<cr>', options)
map('n', '<leader>gg', ':Telescope live_grep<cr>', options)
map('n', '<leader>e', ':e <C-R>=expand("%:.:h") . "/"<CR>', { noremap = true })
map('n', '<leader>h', ':Telescope help_tags<cr>', options)
map('n', '<leader>c', ':Telescope command_history<cr>', options)
-- map('n', '<leader>cm', ':Telescope commands<cr>', options)

-- Toggle LSP diagnostics
vim.keymap.set(
  "",
  "<Leader>l",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

-- Refactoring commands
vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    ":lua require('refactoring').select_refactor()<CR>",
    { noremap = true, silent = true, expr = false }
)

map('n', '<leader>km', ':Telescope keymaps<cr>', options)

map('n', '<leader>s', ':%s/', options)

-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
map('n', 'gb', ':BufferLinePick<cr>', options)
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('x', 'ga', '<Plug>(EasyAlign)', options)
map('n', 'ga', '<Plug>(EasyAlign)', options)
map('x', 'p', '"_dP', options) -- first deletes to the black hole

map('n', 'tt', '<cmd>NvimTreeToggle<cr>', options)
map('n', 'tf', '<cmd>NvimTreeFindFile<cr>', options)

map('n', '<leader>cd', '<cmd>tcd %:p:h | pwd<cr>', options)
map("n", "<leader>xx", "<cmd>Tro  uble document_diagnostics<cr>", options)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", options)


map('n', '<leader>ts', ':TestSuite<cr>', options)
map('n', '<leader>tf', ':TestFile<cr>', options)
map('n', '<leader>tn', ':TestNearest<cr>', options)
map('n', '<leader>tt', ':vsplit | term<cr>', options)
map('n', '<leader>gs', '<cmd>tabnew term://git status<cr>', options)
map('n', '<leader>gl', '<cmd>tabnew term://git log<cr>', options)
map('n', '<leader>gd', '<cmd>tabnew term://git diff<cr>', options)
map('n', '<leader>gs', '<cmd>tabnew term://git --no-pager show<cr>', options)
