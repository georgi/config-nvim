local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', '<Space>', '')

map('t', '<C-o>', '<C-\\><C-n>', { silent = true })

-- map('n', '<leader>p', ':BufferLineCyclePrev<cr>')
-- map('n', '<leader>n', ':BufferLineCycleNext<cr>')
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map('n', '<leader>q', ':bp|bd #<cr>')  -- do not change window split
map('n', '<leader>d', ':bd<cr>')  -- do not change window split

map('n', '<leader><leader>', ':Telescope oldfiles<cr>')

map('n', '<leader>z', ':ZenMode<cr>')
map('n', '<leader>b', ':Telescope buffers<cr>')
map('n', '<leader>o', ':AerialToggle!<cr>')
map('n', '<leader>f', ':Telescope find_files<cr>')
map('n', '<leader>gg', ':Telescope live_grep<cr>')
-- map('n', '<leader>fe', ':e <C-R>=expand("%:.:h") . "/"<CR>', { noremap = true })
map('n', '<leader>h', ':Telescope help_tags<cr>')
map('n', '<leader>c', ':Telescope command_history<cr>')
-- map('n', '<leader>cm', ':Telescope commands<cr>')

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Toggle LSP diagnostics
vim.keymap.set(
  "",
  "<Leader>k",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

-- Refactoring commands
map(
    "v",
    "<leader>rr",
    ":lua require('refactoring').select_refactor()<CR>",
    { noremap = true, silent = true, expr = false }
)

map('n', '<leader>km', ':Telescope keymaps<cr>')

-- map('n', '<leader>s', ':%s/')

-- Remaps for the refactoring operations currently offered by the plugin
map("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
map("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
map("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
map("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
map('n', 'gb', ':BufferLinePick<cr>')
map('n', '<leader><esc>', ':nohlsearch<cr>')
map('x', 'ga', '<Plug>(EasyAlign)')
map('n', 'ga', '<Plug>(EasyAlign)')
map('x', 'p', '"_dP') -- first deletes to the black hole

-- map('n', 'tt', '<cmd>NvimTreeToggle<cr>')
-- map('n', 'tf', '<cmd>NvimTreeFindFile<cr>')

map('n', '<leader>cd', '<cmd>tcd %:p:h | pwd<cr>')
map("n", "<leader>xx", "<cmd>Tro  uble document_diagnostics<cr>")
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")


map('n', '<leader>tw', ':Twilight<cr>')
map('n', '<leader>ts', ':TestSuite<cr>')
map('n', '<leader>tf', ':TestFile<cr>')
map('n', '<leader>tt', ':TestNearest<cr>')
map('n', '<leader>td', ':TodoTrouble<cr>')
map('n', '<leader>gs', '<cmd>tabnew term://git status<cr>')
map('n', '<leader>gl', '<cmd>tabnew term://git log<cr>')
map('n', '<leader>gd', '<cmd>tabnew term://git --no-pager diff<cr>')
map('n', '<leader>gs', '<cmd>tabnew term://git --no-pager show<cr>')
